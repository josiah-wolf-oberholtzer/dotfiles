# This is an alternative approach. Single line in git repo.
# Theme optimised for Terminus and PowerLine compatible fonts.
# This theme for gitprompt.sh is optimized for the "Solarized Dark" and "Solarized Light" color schemes
# without the indicator of the last command state 
# tweaked for Ubuntu terminal fonts


define_helpers() {
    YELLOW=$(tput setaf 3)
    PathShort="\[$YELLOW\][\A] ${Cyan}\w"
}

override_git_prompt_colors() {
    YELLOW=$(tput setaf 3)
    ORANGE=$(tput setaf 9)
    RED=$(tput setaf 1)
    MAGENTA=$(tput setaf 5)
    VIOLET=$(tput setaf 13)
    BLUE=$(tput setaf 4)
    CYAN=$(tput setaf 6)
    GREEN=$(tput setaf 2)
    BOLD=$(tput bold)
    RESET=$(tput sgr0)

    GIT_PROMPT_THEME_NAME="Single_line_Solarized_Lamda"

    GIT_PROMPT_PREFIX="[ "
    GIT_PROMPT_SUFFIX=" ]"
    GIT_PROMPT_SEPARATOR=" |"
    GIT_PROMPT_STAGED=" ${Yellow}● ${ResetColor}"
    GIT_PROMPT_CONFLICTS=" ${Red}✖ ${ResetColor}"
    GIT_PROMPT_CHANGED=" ${Blue}✚ ${ResetColor}"
    GIT_PROMPT_UNTRACKED=" ${Cyan}…${ResetColor}"
    GIT_PROMPT_STASHED=" ${BoldMagenta}⚑ ${ResetColor}"
    GIT_PROMPT_CLEAN=" ${Green}✔ ${ResetColor}"

    GIT_PROMPT_COMMAND_FAIL="${Red}✘"

    GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}${ResetColor}"
    GIT_PROMPT_END_USER="\[$ORANGE\]\nλ ${ResetColor}"
    GIT_PROMPT_END_ROOT="${BoldRed}\n# ${ResetColor}"

    GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="✭"
}

reload_git_prompt_colors "Custom"
