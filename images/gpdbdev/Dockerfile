FROM ubuntu:zesty
RUN apt-get update -q
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y \
	openssh-server \
	krb5-kdc \
	iputils-ping \
	net-tools \
	python-pip \
	gdb \
	g++ \
	make \
	cmake \
	bison \
	flex \
	ccache \
	ninja-build \
	libapr1-dev \
	libevent-dev \
	libxml2-dev \
	libbz2-dev \
	libssl-dev \
	zlib1g-dev \
	python-dev \
	libyaml-dev \
	libperl-dev \
	libreadline-dev \
	libcurl4-gnutls-dev \
	libkrb5-dev \
	locales \
	bzip2 \
	xz-utils \
	runit \
	byobu \
	git \
	rsync \
	patch \
	vim \
	wget \
	gnupg \
	command-not-found \
	unzip \
	pigz \
	iproute2 \
	sudo

RUN locale-gen en_US.UTF-8

RUN pip install \
	psutil \
	lockfile \
	paramiko \
	epydoc

ENV PAGER=less

