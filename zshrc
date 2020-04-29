#############
# Load zgen #
#############
source "${HOME}/.zgen/zgen.zsh"

#######################################
# Plugins and configuration generator #
#######################################
if ! zgen saved; then
  # Personnal configuration
  zgen load hybris42/zsh ${USER}.zsh
  zgen load hybris42/zsh ${USER}.theme

  # Personnal plugins
  source ${HOME}/.zgen/hybris42/zsh-master/hybris.plugins

  # generate the init script from plugins above
  zgen save
fi
