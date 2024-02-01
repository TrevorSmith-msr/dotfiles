# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZ::plugins/asdf/asdf.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit
compinit

. $(brew --prefix)/opt/asdf/libexec/asdf.sh

# Add direnv to the zsh shell
eval "$(direnv hook zsh)"

alias ddg-wo-devise="ddg -e devise -e devise_worker"
alias gen-ssh-key="ssh-keygen -t ed25519 -C 'trevor.smith@measurabl.com'"

eval "$(op completion zsh)"; compdef _op op

zinit cdreplay -q
source /Users/trevorsmith/.docker/init-zsh.sh || true # Added by Docker Desktop
source /Users/trevorsmith/.config/op/plugins.sh

alias opterragrunt='AWS_ACCESS_KEY_ID="op://Private/Measurabl AWS/access key id" AWS_SECRET_ACCESS_KEY="op://Private/Measurabl AWS/secret access key" op run -- terragrunt'
alias op-aws-vault='AWS_ACCESS_KEY_ID="op://Private/Measurabl AWS/access key id" AWS_SECRET_ACCESS_KEY="op://Private/Measurabl AWS/secret access key" op run -- aws-vault'

alias tg='terragrunt'
alias ave='aws-vault exec'

alias docker-full-clean='docker rm $(docker stop $(docker ps -aq)) && docker volume rm $(docker volume ls -q)'
