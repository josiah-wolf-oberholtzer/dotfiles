alias cd='pushd . >> /dev/null;cd'
alias back='popd >> /dev/null'

# go back in navigation history
b() {
  [ -z "$1" ] && local c=1 || local c=$1
  for ((i=1; i<=$c; i++))
  do
    back
  done
}

g() {
    local acronym_inner=`echo ${1:0:1}``echo ${1#?} | sed -e 's/\(.\)/\[\^\/\]\\\+-\1/g'`'[^/]*'
    local glob_inner='[^\]*'`echo $1`'[^\]*'
    local pattern='.*/\('"${acronym_inner}"'\|'"${glob_inner}"'\)/$'
    export choice_set=`
        ls -AF1 -d $GOPATH/*/*/* | 
        grep "$pattern" | 
        awk '{ print length($0) " " $0; }' | 
        sort -n | 
        cut -d ' ' -f 2-`
    get_choice
    [ "$choice_set" != "" ] && cd "$choice_set"
}
