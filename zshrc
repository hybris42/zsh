######################
# Some configuration #
######################
# keychain
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_rsa D79CA887
zstyle :omz:plugins:keychain options --quiet

#############
# Load zgen #
#############
source "${HOME}/.zgen/zgen.zsh"

#######################################
# Plugins and configuration generator #
#######################################
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/jump
  zgen oh-my-zsh plugins/keychain
  zgen oh-my-zsh plugins/rsync
  zgen oh-my-zsh plugins/systemadmin
  zgen oh-my-zsh plugins/z

  # personnal configuration
  zgen load hybris42/zsh hybris.zsh
  zgen load hybris42/zsh bearstech.zsh
  zgen load hybris42/zsh hybris.theme

  # generate the init script from plugins above
  zgen save
fi
