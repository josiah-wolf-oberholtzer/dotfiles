get_choice() {
  local count=`printf "$choice_set" | wc -l | awk '{print $1}'`
  [ ${#choice_set} -eq 0 ] || count=$((count+1))
  local re='^([0-9]+)$'
  if [ $count -eq 0 ]; then
    echo "No match found" && export choice_set=""
  elif [ $count -eq 1 ]; then
    export choice_set="$choice_set"
  else
    printf "$choice_set\n" | nl
    local s=0
    local p="p"
    while [ "$s" != "q" ] && ( ! [[ $s =~ $re ]] || ! [ $s -le $count -a $s -gt 0 ] )
    do
      if [[ "$s" =~ [a-zA-Z] ]]; then
        local filtered_choice_set=`printf "$choice_set" | grep -i ".*$s.*"`
        local filtered_count=`printf "$filtered_choice_set" | wc -l | awk '{print $1}'`
        [ ${#filtered_choice_set} -eq 0 ] || filtered_count=$((filtered_count+1))
        [ $filtered_count -gt 1 ] && choice_set="$filtered_choice_set" && count=$filtered_count && printf "$choice_set\n" | nl
        [ $filtered_count -eq 1 ] && choice_set="$filtered_choice_set" && return 0
      fi
      read s
    done
    [ "$s" != "q" ] && export choice_set="`printf \"$choice_set\" | sed -n $s$p 2>/dev/null`" || export choice_set=""
  fi
}
