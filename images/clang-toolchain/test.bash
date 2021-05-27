#!/bin/bash

set -e -u -o pipefail

it_has_executables() {
	type -p bison flex
	type -p ccache
	type -p cmake
	type -p clang-format-11
	type -p clang-tidy-11
	type -p clang++-11 clang-11
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
