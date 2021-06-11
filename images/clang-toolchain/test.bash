#!/bin/bash

set -e -u -o pipefail

it_has_executables() {
	type -p bison flex
	type -p ccache
	type -p cmake
	type -p clang-format-12
	type -p clang-tidy-12
	type -p clang++-12 clang-12
	type -p xargs
	type -p git
	type -p parallel
	type -p ninja
	type -p bear
}

_main() {
	it_has_executables
	ldconfig -p | grep libxerces
}

_main "$@"
