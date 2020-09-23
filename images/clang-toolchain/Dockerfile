FROM ubuntu:focal AS base
RUN apt-get update -q
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	clang-format-10 \
	git \
	parallel
FROM base AS test
COPY test.bash /
RUN /test.bash
FROM base
