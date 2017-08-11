#!/bin/bash

set -e

workdir=.cover
profile="$workdir/cover.out"
result="$workdir/cover.html"
mode="count"
# mode="set"

# install dependencies if needed
go get github.com/wadey/gocovmerge

generate_cover_data() {
  rm -rf "$workdir"
  mkdir "$workdir"

  # which packages to run tests on
  PKG=`glide novendor | grep -v '/cmd'`
  # which packages to consider coverage for (eg. exclude commands, which are not expected to have coverage)
  NON_TEST_PKG=`glide novendor | grep -v '/cmd' | grep -v 'tests'`
  PKG_LIST=`echo $NON_TEST_PKG | tr ' ' ,`
  for pkg in $PKG; do
    echo '***' $pkg
    f="$workdir/$(echo $pkg | tr / -).cover"
    go test -covermode="$mode" -coverprofile="$f" -coverpkg "$PKG_LIST" "$pkg" 2>&1 | grep -v 'no packages being tested depend on'
  done

  gocovmerge "$workdir"/*.cover >"$profile"
}

generate_cover_data
echo "*****"
go tool cover -func="$profile" | grep '^total'

# later parse coverage with
# total:.+(\d+\.\d+)\%
# (\d+\.\d+)\%\s*$

go tool cover -html="$profile" -o "$result"
