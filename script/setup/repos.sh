#!/bin/bash

set -eux

export PATH=$PATH:$HOME/relma/bin
ghq get -P \
  jiro4989/faker \
  jiro4989/nimjson \
  jiro4989/sandbox \
  jiro4989/scripts \
  jiro4989/setup-nim-action \
  jiro4989/textimg \
  jiro4989/websh \
  jiro4989/workspace \
  ;
