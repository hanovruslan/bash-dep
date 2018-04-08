## how to include external sh source ##

1. git clone this repo into the root of your project into bash-dep subdir by git default
1. set up `DEP-env.sh` - see the very next section below
1. run `add.sh`

### Set up DEP-env.sh ###

* **origin** - **required** repository link
* path - optional, dir name for bash dep, By default is equal to `DEP` as a part of your `DEP-env.sh` file name
* source - optional, path to the main source file, `src/src.sh` by default

Examples:
* [origin/DEP-env.sh](origin/DEP-env.sh) - use by default if you run add.sh without arg
* [origin/DEP-2-env.sh](origin/DEP-2-env.sh) 
* [origin/DEP-3-env.sh](origin/DEP-3-env.sh) 

### run add.sh ###

```

./bash-dep/add.sh ${abs-path-to-your-DEP-env.sh}

``` 
see post-instruction in the output

These ones

```
include these lines

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
source ${self_dir}/bash-dep/dep/${DEP}/src/src.sh

```

${DEP} - is your dep name


#### multiple deps ####


```

./bash-dep/add.sh ${abs-path-to-your-DEP-env.sh}
./bash-dep/add.sh ${abs-path-to-your-OTHER-DEP-env.sh}

```

### WARNING ###

This is bash without any kind of overwrite protection and so on. Be carefull with file names

