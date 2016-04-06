#!/usr/bin/env bash

stow -vvv \
  --target ~ \
  --ignore='\.sw[pon]' \
  "$@"
