# Query Processing Docker files and Pipeline to publish the image

# Repository structure
This repository is structured as follows:

| File name   |  description |
| ------------|--------------|
| README.md   | This file.    |
| pipelines/  | Contains pipeline files |
| images/     | Dockerfile for respective images in their directory & corresponding test task & scripts.|

# Running tests locally
Let's say you are working on images/clang-toolchain, and you realize `clang-tidy-10` was not installed.

## Adding a test
Add a test in `images/clang-toolchain/test.bash`. Look around, there is a test
called `it_has_executables` and it runs `type -p` over a list of things that
we expect to be in the path. Append `clang-tidy-10` to that list.

## Running the tests
We use a [two-stage build][docker.multi-stage] where a simple "test" stage runs some assertions over the built image.
Testing is integrated with building of the image:

```sh
docker build --pull --target test images/clang-toolchain
echo $?
```

The flag `--target test` ensures that `docker build` doesn't optimize away the test stage because it's not used to produce the final output.

If the return status is 0, your test is wrong because it's not broken, otherwise
you've written a test that successfully failed.

## Fixing the test
Fix the test by adding `clang-tidy-10` executable to the image
-- in this case, we add `clang-tidy-10` to the list of packages we `apt-get install` in the `Dockerfile`.
In other cases, the package name might differ from the executable name.
