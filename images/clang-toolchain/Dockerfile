FROM ubuntu:focal AS base
RUN apt-get update -q
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	bear \
	ccache \
	bison \
	flex \
	cmake \
	clang-format-11 \
	clang-tidy-11 \
	git \
	parallel \
	ninja-build \
	libxerces-c-dev
FROM base AS test
COPY test.bash /
RUN /test.bash
FROM base
