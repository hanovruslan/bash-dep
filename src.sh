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
    local path="${1}"
    ( \
    source ${path}
    export path="dep/$(bg_get_path ${path})"
    export origin # must be in the path
    export source='${self_dir}/'$(basename ${self_dir})/${path}/${source:-"src/src.sh"}
    bg_do_add "${origin}" "${path}" "${source}" \ 
    )
}
bg_get_path () {
    local path=$(basename ${1})
    [[ "${path}" =~ ^(.*)-env.sh$ ]] \
    || echo "${path}" \
    && printf "%s" "${BASH_REMATCH[1]}"
}
bg_do_add () {
    local origin=${1}
    local path=${2}
    local source=${3}
    ( \
    cd ${self_dir} \
    && bd_init ${origin} ${path} \
    && cd ${path} \
    && bd_get_stable \
    && bg_hint ${source} \
    )
}
bg_hint() {
    local source=${1}
    echo \
    && echo 'include these lines' \
    && echo \
    && echo 'self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"' \
    && echo source ${source} \
    && echo
}
