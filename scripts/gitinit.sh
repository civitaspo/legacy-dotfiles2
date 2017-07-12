#!/bin/bash -eux

APP_ROOT="$(cd $(dirname $0)/..; pwd)"

(
    cd $APP_ROOT
    git config --local include.path ../.gitconfig
)
