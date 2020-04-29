# bip at command end, resize font
function precmd() {
    echo -n -e "\a"
}

# do not share history between terms...
unsetopt share_history

# Everyday aliases
j()		 {if [ $# -eq 0 ]; then marks; else jump $@; fi}

# Some exports
export EDITOR=emacs
export LESS=-cex2MRX
export LESSOPEN='|~/.lessfilter %s'
export LOGCHECK=60
export READNULLCMD=${PAGER:-/usr/bin/pager}
export WATCH=all
export WATCHFMT="%n has %a %l from %M"
