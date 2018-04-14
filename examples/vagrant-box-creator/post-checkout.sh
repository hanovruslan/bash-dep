#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
export _self_dir="${self_dir}"

git clone git@github.com:hanovruslan/bash-dep.git "${PWD}/bash-dep"

bg_hint () {
  echo -e "\n\nrun ${_self_dir}/../../dep/vagrant-box-creator/src/src-external.sh \${machine_name} \${path_to_dir_with_vagrantfile} \${vagrantfile_name}\n\n"
}

. ./bash-dep/add.sh "${self_dir}/vagrant-box-creator-env.sh"
