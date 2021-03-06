#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
export _PWD=${PWD}
git clone git@github.com:hanovruslan/bash-dep.git "${PWD}/bash-dep"

bg_hint () {
  echo -e "\n\nrun ${_PWD}/bash-dep/dep/vagrant-box-creator/src/src-external.sh \${machine_name} \${path_to_dir_with_vagrantfile} \${vagrantfile_name}\n\n"
}

. ./bash-dep/add.sh "${self_dir}/vagrant-box-creator-env.sh"
