## how to include external sh source ##

1. git clone this repo into the root of your project
1. set up `env.sh`
1. template `add.sh-dist`
1. run templated `add.sh-dist`

### Set up env.sh ###

**bgo_path** - dir name for bash dep
**bgo_origin** - repository
**bgo_source** - path to the main source file

Example [origin/bgo/env.sh](origin/bgo/env.sh) 


### Template add.sh-dist ###

file content

```
#!/usr/bin/env bash

export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/src.sh"
source "${self_dir}/origin/EXAMPLE/env.sh"

bg_add "${EXAMPLE_origin}" "${EXAMPLE_path}" "${EXAMPLE_source}" "EXAMPLE_path"

```

1. copy `add.sh-dist` into `add-EXAMPLE.sh`
1. Replace in this file `EXAMPLE` with `your_dep_name`


### run add.sh ###

#### multiple deps ####

You can include more then once line `env.sh` and call for `bg_add` also more then once

```

source "${self_dir}/origin/EXAMPLE/env.sh"
source "${self_dir}/origin/EXAMPLE_2/env.sh"

bg_add "${EXAMPLE_origin}" "${EXAMPLE_path}" "${EXAMPLE_source}" "EXAMPLE_path"
bg_add "${EXAMPLE_2_origin}" "${EXAMPLE_2_path}" "${EXAMPLE_2_source}" "EXAMPLE_2_path"

```

