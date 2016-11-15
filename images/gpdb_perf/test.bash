#!/bin/bash

set -e -u -o pipefail
set -o posix
set -x

main() {
  it_has_executables
  it_has_ruby23
}

it_has_executables() {
  local EXECUTABLES=(
    psql
    bosh
  )
  for executable in "${EXECUTABLES[@]}"; do
    type -p "${executable}"
  done
}

it_has_ruby23() {
  ruby --version | grep "ruby 2.3"
}

main "$@"
