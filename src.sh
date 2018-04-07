#@IgnoreInspection BashAddShebang
bd_git_prepare () {
    git checkout master \
    && git branch -d current
    git fetch -vv --all && git pull
}
bd_checkout () {
    [ ! -z "${version:=$(git tag -l|grep -P "^\d+\.\d+\.\d+$"|tail -n 1)}" ] \
    && git checkout tags/${version} -b current 
}
bd_failed () {
    echo stable version not found >&2
    exit 1
}
bd_get_stable () {
    bd_git_prepare \
    && bd_checkout \
    || bd_failed
}
bd_init () {
    local from="${1}"
    local to="${2}"

    git clone ${from} ${to}
}
bg_add () {
    local origin=${1}
    local path=${2}
    local source=${3}
    local path_name=${4}

    ( \
    cd ${self_dir} \
    && bd_init ${origin} ${path} \
    && cd ${path} \
    && bd_get_stable \
    && export path=$(basename ${self_dir})'/'${path} \
    && bg_show_hint ${source} ${path_name} \
    )
}
bg_show_hint() {
    local source=${1}
    local path_name=${2}

    echo \
    && echo 'include these lines' \
    && echo \
    && echo 'self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"' \
    && echo "source \"${source}\"" | envsubst '$'${path_name} \
    && echo
}