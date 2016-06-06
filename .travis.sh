#!/bin/bash

set -e -u -o pipefail

# To install gometalinter
if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
  go get -u github.com/alecthomas/gometalinter
  gometalinter --install --update
  echo "Running gometalinter"
  # $GOPATH/src/github.com/keybase/go-updater
  echo "Current directory: `pwd`"
  gometalinter --deadline=300s --vendor --cyclo-over=20 --dupl-threshold=100 ./...
fi
