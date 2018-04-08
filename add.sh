#!/usr/bin/env bash

export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/src.sh"

dep=${1:-"${self_dir}/origin/EXAMPLE-env.sh"}

bg_add "${dep}" 
