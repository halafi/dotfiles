# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="~/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

DISABLE_AUTO_UPDATE="true"


source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/antigen/antigen.zsh
export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

plugins=(osx,zsh-autosuggestions,zsh-syntax-highlighting,autojump)

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

alias ll='ls -alhF'
alias ...='cd ../..'
alias cd..='cd ..'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout master'
alias ggrh= 'git reset --hard HEAD'
alias gm= 'git merge'
alias gmm= 'git merge master'
alias gc='git cz'
alias ga='git add'
alias grs='git restore --staged'
alias gaa='git add --all'
alias tma='tmux attach'
alias xtar='tar -xvzf'
alias ctar='tar -cvzf'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias port8080='lsof -n -i:8080 | grep LISTEN'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias canon='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
alias kall='killall grunt gulp node'
alias zshup='/usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh'
alias nta='nx test app --watch --test-file'
alias ntui='nx test ui --watch --test-file'
alias ntapi='nx test api --watch --test-file'
alias yarnup='yarn upgrade-interactive --latest'
alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"
alias rr="ranger"
alias pag="ps aux | rg"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=$HOME/go-workspace
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export VIMCONFIG=$HOME/.config/nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"
eval "$(pyenv init --path)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export VISUAL=nvim;
export EDITOR=nvim;


source ~/.config/broot/launcher/bash/br
