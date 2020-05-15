# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#---- ZSH environment vars ----
# Antigen runtime, bundles, cache,...
ADOTDIR=~/.cache/zsh-antigen
#------------------------------

# Source Zsh specific aliases
source ~/.zsh/aliases.zsh

# Source completions
source ~/.zsh/completions.zsh
[ -f ~/.zsh/completions-local.zsh ] && source ~/.zsh/completions-local.zsh
# it looks that completion system will be already initialized by Antigen
#autoload -Uz compinit
#compinit

# Load Antigen - the ZSH package manager (https://github.com/zsh-users/antigen)
source ~/.zsh/antigen.zsh
# and Antigen run commands
antigen init ~/.zsh/antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.zsh/p10k.zsh ]] && source ~/.zsh/p10k.zsh
