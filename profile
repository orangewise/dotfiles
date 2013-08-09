echo ".profile" $SHELL

source ~/.aliases
source ~/.functions
source ~/.git-prompt

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "
\\\$ "'