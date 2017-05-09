#!/bin/bash
set -e

DEBUG="-l debug"
if [ -z "$1" ]; then
  DEBUG=""
fi

bin/setup

# Homebrew does not allow sudo.
case "$(uname)" in
  "Darwin")  bin/mitamae local lib/recipe.rb $DEBUG ;;
  *) sudo -E bin/mitamae local lib/recipe.rb $DUBUG ;;
esac
