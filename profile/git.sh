# BASH GIT PROMPT AND COMPLETION
# ==============================

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

GIT_PROMPT_THEME=Custom

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
	source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

repo_info() {
    dir=`pwd`
    [[ $dir != *"$GOPATH/"* ]] && export git_local_path="." && return 1
    path=`echo ${dir#$GOPATH}`
    count=$(echo "${path}" | awk -F"/" '{print NF-1}')
    export git_path=""
    [ $count -ge 1 ] && export git_domain=$(echo $path | cut -d'/' -f2) && git_path=$git_domain || export git_domain=""
    [ $count -ge 2 ] && export git_org=$(echo $path | cut -d'/' -f3) && git_path="$git_path/$git_org" || export git_org=""
    [ $count -ge 3 ] && export git_repo=$(echo $path | cut -d'/' -f4) && git_path="$git_path/$git_repo" || export git_repo=""
    export git_tree=`echo ${dir#$GOPATH/$git_domain/$git_org/$git_repo/}`
    export git_local_path="$GOPATH/$git_path"
    [ $git_tree != $dir ] || export git_tree=""
    [ ! -z $git_repo ] && export git_branch=`git rev-parse --abbrev-ref HEAD`

    if [ "-s" != "$1" ] ;
    then
        echo "domain (git_domain):  $git_domain"
        echo "org (git_org):  $git_org"
        echo "repo (git_repo):  $git_repo"
        echo "tree (git_tree):  $git_tree"
        echo "branch (git_branch):  $git_branch"
    fi
}

clone() {
    repo=$1
    if [[ $repo != *"/"* ]] ; then
        repo_info -s || (echo "no repo found" && return 1)
        repo="git@$git_domain:$git_org/$repo.git"
    fi
    echo $repo
    clone_dir=$(echo $repo | sed "s/.*:\//:\//g" | sed "s/git@/:\/\//g" | sed "s/:\/\///g" | sed "s/:/\//g" | sed "s/\.git//g")
    clone_dir="$GOPATH/$clone_dir"
    git clone $repo $clone_dir
    cd $clone_dir
}
