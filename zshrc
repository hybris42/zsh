#############
# Load zgen #
#############
source "${HOME}/.zgen/zgen.zsh"

#######################################
# Plugins and configuration generator #
#######################################
if ! zgen saved; then
  # Configuration
  zgen load hybris42/zsh ${USER}.zsh
  # Plugins
  zgen load hybris42/zsh ${USER}.plugins
  # Theme
  zgen load hybris42/zsh ${USER}.theme
  # Completions
  zgen load hybris42/zsh ${USER}.completions

  # generate the init script from plugins above
  zgen save
fi
