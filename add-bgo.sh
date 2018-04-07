#!/usr/bin/env bash

export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/src.sh"
source "${self_dir}/origin/bgo/env.sh"

bg_add "${bgo_origin}" "${bgo_path}" "${bgo_source}" "bgo_path"
