## how to include external sh source ##

1. git clone this repo into the root of your project
1. set up `origin/EXAMPLE-env.sh`
1. set up `add-EXAMPLE.sh`
1. run `add-EXAMPLE.sh`

### Set up origin/EXAMPLE-env.sh ###

**origin** - repository link, required
**path** - dir name for bash dep, optional. By default is equal to `EXAMPLE` of your `EAMPLE-env.sh`
**source** - path to the main source file, optional. By default is equal to `src/src.sh`

Examples:
* [origin/EXAMPLE-env.sh](origin/EXAMPLE-env.sh) 
* [origin/EXAMPLE-2-env.sh](origin/EXAMPLE-2-env.sh) 
* [origin/EXAMPLE-3-env.sh](origin/EXAMPLE-3-env.sh) 

### Set up add-EXAMPLE.sh ###

file content

```
#!/usr/bin/env bash

export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/src.sh"

bg_add "${self_dir}/origin/EXAMPLE-env.sh" 

```

1. modify the last line if needed
1. rename `add-EXAMPLE.sh` into something if needed


### run add-EXAMPLE.sh ###

#### multiple deps ####

You can include more then once line `env.sh` and call for `bg_add` also more then once

```

bg_add "${self_dir}/origin/EXAMPLE-env.sh" 
bg_add "${self_dir}/origin/EXAMPLE--2-env.sh" 

```

### WARNING ###

This is bash without any kind of overwrite protection and so on. Be carefull with file names

