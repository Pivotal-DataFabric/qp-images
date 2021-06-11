FROM ubuntu:focal AS llvm-gpg-key
RUN apt-get update -q && apt-get upgrade -y ca-certificates
RUN apt-get install -y gpg curl

ARG KEY_URL=https://apt.llvm.org/llvm-snapshot.gpg.key
ARG KEY_ID=15CF4D18AF4F7421
ARG KEYRING=llvm.gpg
RUN curl -fsSL "${KEY_URL}" | gpg --dearmor > /usr/share/keyrings/"${KEYRING}"
# verify integrity of key
RUN gpg --no-default-keyring --keyring /usr/share/keyrings/"${KEYRING}" --list-keys "${KEY_ID}"

FROM ubuntu:focal AS base
RUN apt-get update -q && apt-get upgrade -y ca-certificates
COPY --from=llvm-gpg-key /usr/share/keyrings/llvm.gpg /usr/share/keyrings/llvm.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/llvm.gpg] http://apt.llvm.org/focal/ llvm-toolchain-focal-12 main" > /etc/apt/sources.list.d/llvm-toolchain.list
RUN apt-get update -q
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	bear \
	ccache \
	bison \
	flex \
	cmake \
	clang-format-12 \
	clang-tidy-12 \
	git \
	parallel \
	ninja-build \
	libxerces-c-dev

FROM base AS test
COPY test.bash /
RUN /test.bash
FROM base
