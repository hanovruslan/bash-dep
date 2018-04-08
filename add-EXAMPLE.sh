#!/usr/bin/env bash

export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/src.sh"

bg_add "${self_dir}/origin/EXAMPLE-env.sh" 
