# EXPORTS
# =======

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/Applications/LilyPond.app/Contents/Resources/bin/
export PATH=$PATH:/Applications/SuperCollider/SuperCollider.app/Contents/Resources/
export PATH=$PATH:/Applications/SuperCollider/SuperCollider.app/Contents/MacOS/
export GOPATH=~/Source

# ALIASES
# =======

alias vi=nvim
alias vim=nvim
alias ls="ls -F -G"

# SOURCES
# =======

PROFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sources=( core navigation git docker python )
for i in "${sources[@]}"
do
    source "$PROFILE_DIR/$i.sh"
done
