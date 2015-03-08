
alias ll="ls -lhAGL"
alias sshovh="ssh studentd@ftp.cluster015.ovh.net"
alias s="grep -R --color"

PROMPT_COLOR_DEFAULT="\033[37m";
PROMPT_COLOR_ROOT="\033[31m";
PROMPT_COLOR_GIT="\033[32m";
PROMPT_COLOR_GIT_FAR="\033[34m";

. ~/git/github.utils/bash_prompt.sh

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

