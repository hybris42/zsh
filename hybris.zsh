# keychain
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_rsa D79CA887
zstyle :omz:plugins:keychain options --quiet

# bip at command end, resize font
function precmd() {
    echo -n -e "\a"
#    [ -n "${DISPLAY}" ] && /home/hybris/.scripts/term-fontsize
}

# do not share history between terms...
unsetopt share_history

# Everyday aliases
catwhich()       {echo "\e[35mPath: $(which $1)\n\e[39m"; cat $(which $1)}
colorixe()       {for a in $@; do ccat $a | less; done}
dchroot()        {docker run --rm --privileged -ti $@ debian:stretch /bin/bash}
dontknow()       {echo -n "¯\\_(ツ)_/¯" | xclip}
dualscreen()     {[ $# -eq 1 ] && xrandr --auto && xrandr --output $1 --primary --output eDP1 --left-of $1}
e()              {emacsclient -n $@ > /dev/null 2>&1}
tramp()          {emacsclient -n $(for x in $@; do echo /root@$x:README; done) > /dev/null 2>&1}
fd()             {fdfind -H -I -L $@}
ips()            {i=0; while [ $i -lt 10 ]; do curl -s ipinfo.io | jq '.ip'; i=$(($i + 1)); done | sort | uniq -c}
j()		 {if [ $# -eq 0 ]; then marks; else jump $@; fi}
loop()		 {while [ 1 ]; do sh -c "$@"; done}
open_ports()	 {if [ $# -eq 1 ] && [ $1 = "public" ]; then sudo netstat -tulpen 2> /dev/null | grep "LISTEN" | grep -v "127.0.0.1"; else sudo netstat -tulpen 2> /dev/null | grep "LISTEN"; fi}
r()		 {if [ $# -gt 0 ]; then for h in $@; do ssh root@$h; done; else sudo su -; fi}
ra()             {if [ $# -gt 0 ]; then for h in $@; do ssh -A root@$h; done; else sudo su -; fi}
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
