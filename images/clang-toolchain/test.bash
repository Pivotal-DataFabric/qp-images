#!/bin/bash

set -e -u -o pipefail

it_has_executables() {
	type -p clang-format-11
	type -p xargs
	type -p git
	type -p parallel
}

_main() {
	it_has_executables
}

_main "$@"
