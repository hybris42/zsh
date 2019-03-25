# bip at command end
function precmd() {echo -n -e "\a"}

# do not share history between terms...
unsetopt share_history

# Everyday aliases
catwhich()       {echo "\e[35mPath: $(which $1)\n\e[39m"; cat $(which $1)}
cless()          {for a in $@; do ccat $a | less; done}
e()              {emacsclient -n $@ > /dev/null 2>&1}
j()		 {if [ $# -eq 0 ]; then marks; else jump $@; fi}
loop()		 {while [ 1 ]; do sh -c "$@"; done}
open_ports()	 {sudo netstat -tulpen 2> /dev/null | grep "LISTEN"}
r()		 {if [ $# -gt 0 ]; then for h in $@; do ssh root@$h; done; else sudo su -; fi}
dontknow()       {echo -n "¯\\_(ツ)_/¯" | xclip}
dchroot()        {docker run --rm --privileged -ti $@ debian:stretch /bin/bash}
sc-error()       {xdg-open "https://github.com/koalaman/shellcheck/wiki/$1"}

# Usefull bindings
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# Some exports
export EDITOR=emacsclient
export LESS=-cex2MRX
export LESSOPEN='|~/.lessfilter %s'
export LOGCHECK=60
export PATH=$HOME/.scripts:$PATH
export READNULLCMD=${PAGER:-/usr/bin/pager}
export WATCH=all
export WATCHFMT="%n has %a %l from %M"

# Some completions
compctl -K _completemarks    j
