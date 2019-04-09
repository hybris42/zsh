# resize term font
term-fontsize() {
    if [ $# -ne 1 ]; then
        exit 1
    else
        printf '\33]710;%s%d\007' "xft:Source Code Pro:pixelsize=$1:antialias=true"
        printf '\33]711;%s%d\007' "xft:Source Code Pro:pixelsize=$1:antialias=true"
        printf '\33]712;%s%d\007' "xft:Source Code Pro:pixelsize=$1:antialias=true"
        printf '\33]713;%s%d\007' "xft:Source Code Pro:pixelsize=$1:antialias=true"
    fi
}

# bip at command end
function precmd() {
    echo -n -e "\a"
    main_screen=$(echo "if require('awful.screen').focused().index == 1 then return('main-screen') end" | awesome-client)
    if [ $main_screen ]; then
        term-fontsize $(cat ~/.config/term-fontsize_1)
    else
        term-fontsize $(cat ~/.config/term-fontsize_2)
    fi
}

# do not share history between terms...
unsetopt share_history

# Everyday aliases
catwhich()       {echo "\e[35mPath: $(which $1)\n\e[39m"; cat $(which $1)}
cless()          {for a in $@; do ccat $a | less; done}
dchroot()        {docker run --rm --privileged -ti $@ debian:stretch /bin/bash}
dontknow()       {echo -n "¯\\_(ツ)_/¯" | xclip}
e()              {emacsclient -n $@ > /dev/null 2>&1}
fd()             {fdfind -H -I -L $@}
j()		 {if [ $# -eq 0 ]; then marks; else jump $@; fi}
loop()		 {while [ 1 ]; do sh -c "$@"; done}
open_ports()	 {if [ $# -eq 1 ] && [ $1 = "public" ]; then sudo netstat -tulpen 2> /dev/null | grep "LISTEN" | grep -v "127.0.0.1"; else sudo netstat -tulpen 2> /dev/null | grep "LISTEN"; fi}
r()		 {if [ $# -gt 0 ]; then for h in $@; do ssh root@$h; done; else sudo su -; fi}
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
compdef    _path_commands    catwhich
