# Common ZSH/Bash/... stuff.
# This line is placed above instant prompt as homeshick refresh prompts for input.
source ~/.shell/shellrc

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

# Source manually installed completions
source ~/.zsh/completion-loader.zsh
[ -f ~/.zsh/completion-local.zsh ] && source ~/.zsh/completion-local.zsh
# it looks that completion system will be already initialized by Antigen
#autoload -Uz compinit
#compinit

# Load Antigen - the ZSH package manager (https://github.com/zsh-users/antigen)
source ~/.zsh/antigen/antigen.zsh
# and Antigen run commands
antigen init ~/.zsh/antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.zsh/p10k.zsh ]] && source ~/.zsh/p10k.zsh

# Source Zsh specific aliases, can unalias oh-my-zsh stuff like gm
[[ -f "${HOME}/.zsh/aliases.zsh" ]] && source "${HOME}/.zsh/aliases.zsh"

