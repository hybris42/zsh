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
  # Theme
  zgen load hybris42/zsh ${USER}.theme
  # Plugins
  zgen load hybris42/zsh ${USER}.plugins
  # Completions
  zgen load hybris42/zsh ${USER}.completions

  # generate the init script from plugins above
  zgen save
fi
