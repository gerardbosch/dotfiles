# Common ZSH/Bash/... stuff.
# This line is placed above instant prompt as homeshick refresh prompts for input.
source $HOME/.shell/shellrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ⚠  Before running compinit, source completions/set fpath
for file in $HOME/.zsh/zshrc.d/*; do
  source "$file"
done
# completion system will be initialized by Antigen, don't do it before!
#autoload -Uz compinit
#compinit

# Antigen runtime, bundles, cache,...
ADOTDIR=~/.cache/zsh-antigen

# Load Antigen - the ZSH package manager (https://github.com/zsh-users/antigen)
source ~/.zsh/antigen/antigen.zsh
# and Antigen run commands
antigen init ~/.zsh/antigenrc

# To customize prompt, run `p10k configure` or edit .zsh/.p10k.zsh
[[ -f ~/.zsh/p10k.zsh ]] && source ~/.zsh/p10k.zsh

