# bip at command end
function precmd() {echo -n -e "\a"}

# do not share history between terms...
unsetopt share_history

# Load keychain
# keychain -q --agents ssh id_rsa id_dsa

# Everyday aliases
c-cat()          {for a in $@; do colorize_via_pygmentize $a; done}
c-less()         {for a in $@; do colorize_via_pygmentize $a | less; done}
e()              {emacsclient -n $@ > /dev/null 2>&1}
health()	 {/usr/bin/screen -O -S health -c ~/.config/screen_health}
j()		 {if [ $# -eq 0 ]; then marks; else jump $@; fi}
loop()		 {while [ 1 ]; do sh -c "$@"; done}
open_ports()	 {sudo netstat -tulpen 2> /dev/null | grep "LISTEN"}
r()		 {if [ $# -eq 1 ]; then ssh root@$1; else sudo su -; fi}
dontknow()       {echo -n "¯\\_(ツ)_/¯" | xclip}
def()            {echo "default_path = '$PWD'" | awesome-client}
dchroot()        {docker run --rm --privileged -ti $@ debian:stretch /bin/bash}

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
