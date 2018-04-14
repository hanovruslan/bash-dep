#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

git clone git@github.com:hanovruslan/bash-dep.git "${self_dir}/bash-dep"

. ./bash-dep/add.sh "${self_dir}/bash-get-options-env.sh"
