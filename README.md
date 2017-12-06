# Query Processing Docker files and Pipeline to publish the image

## Repository structure
This repository is structured as follows:

| File name   |  description |
| ------------|--------------|
| README.md   | This file.    |
| pipelines/  | Contains pipeline files |
| images/     | Dockerfile for respective images in their directory & corresponding test task & scripts.|

## Running tests locally
Let's say you are working on images/gpdbdev, and you realize `ip` was not installed.

1. Add a test in `images/gpdbdev/test.bash`. Look around, there is a test
   called `it_has_executables` and it runs `type -p` over a list of things that
   we expect to be in the path. Append `ip` to that list.
1. Assuming you run Bash:
    ```
    docker run --rm -ti $(docker build -q images/gpdbdev) /bin/bash < images/gpdbdev/test.bash
    echo $?
    ```
    In fish, you run
    ```
    docker run --rm -ti (docker build -q images/gpdbdev) /bin/bash < images/gpdbdev/test.bash
    echo $status
    ```

    The subshell above runs a variant of `docker build`: it builds the image
    "quietly" and spits out the image ID (assuming there's no image building
    failure)

    If the status is 0, your test is wrong because it's not broken, otherwise
    you've written a test that successfully failed

1. Fix the test by adding `ip` to the image, in this case, we add `iproute2` to
   the list of packages we `apt-get install` in the `Dockerfile`
