# Setup
## VSCode Plugins (update 08-2020)
* [Code Time](https://marketplace.visualstudio.com/items?itemName=softwaredotcom.swdc-vscode)
* [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
* [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
* [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
* [IntelliJ IDEA Keybindings](https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings)
* [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
* [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
* [vscode-database](https://marketplace.visualstudio.com/items?itemName=bajdzis.vscode-database)
* [Path Autocomplete](https://marketplace.visualstudio.com/items?itemName=ionutvmi.path-autocomplete)
* [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
* [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
* [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)
* [GraphQL by Prisma](https://marketplace.visualstudio.com/items?itemName=Prisma.vscode-graphql)
* [All Autocomplete](https://marketplace.visualstudio.com/items?itemName=Atishay-Jain.All-Autocomplete)
* [VS Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)

...

## Chrome Extensions (update 08-2020)
### Browsing
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm/related?hl=en)
* [I don't care about cookies](https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja?hl=en)
* [LastPass: Free Password Manager](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)
* [Block Site](https://chrome.google.com/webstore/detail/block-site-website-blocke/eiimnmioipafcokbfikbljfdeojpcgbh?hl=en)

### Development
* [Wappalyzer](https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg?hl=en)
* [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en)
* [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
* [Linkclump](https://chrome.google.com/webstore/detail/linkclump/lfpjkncokllnfokkgpkobnkbkmelfefj?hl=en)
* [OctoLinker](https://chrome.google.com/webstore/detail/octolinker/jlmafbaeoofdegohdhinkhilhclaklkp)
* [Project Naptha](https://chrome.google.com/webstore/detail/project-naptha/molncoemjfmpgdkbdlbjmhlcgniigdnf)
* [Page Ruler Redux](https://chrome.google.com/webstore/detail/page-ruler-redux/giejhjebcalaheckengmchjekofhhmal?hl=en)

#### DevTools
* [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en)
* [Redux DevTools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd?hl=en)
* [Svelte Devtools](https://chrome.google.com/webstore/detail/svelte-devtools/ckolcbmkjpjmangdbmnkpjigpkddpogn)
* [Vue.js devtools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd?hl=en)

## OSX
### Brew packages
* cask
* fasd
* jq (json)
* nvm
* colordiff
* htop
* python
* the_silver_searcher (ag)
* cowsay
* httpie
* tree
* gotty (share your terminal as a web application)
* hh (search terminal history)
* wget
* watchman
* graphicsmagic
* imagemagick
* tig
### Cask packages
* numi (epic calculator)
* caffeine (prevent sleep)
* dash (documentation)
* spectacle (window manager)

`brew cask install ...`
`brew install tig ...`

### Aliases
```
alias ll='ls -alhF'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias gs='git status'
alias gp='git push'
alias gm='git merge'
alias gl='git pull'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gc='git commit -v'
alias gbnm='git branch --no-merged'
alias ga='git add'
alias gaa='git add --all'
alias xtar='tar -xvzf'
alias ctar='tar -cvzf'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias port8080='lsof -n -i:8080 | grep LISTEN'
alias port8000='lsof -n -i:8000 | grep LISTEN'
alias port8001='lsof -n -i:8001 | grep LISTEN'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias canon='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
```

### Config
```
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```
### Applications
```
Alfred 3.app
Android Studio.app
Be Focused.app
Caffeine.app
Commander One.app
Cypress.app
Dash.app
Discord.app
Docker.app
Firefox.app
Flux.app
Franz.app
Google Chrome Canary.app
Google Chrome.app
Hyper.app
ImageOptim.app
Keybase.app
Keyboard Maestro.app
MacVim.app
Monit.app
Monosnap.app
NotePlan.app
Numi.app
Oni.app
Safari.app
Screenhero.app
Sip.app
Sketch.app
Slack.app
SourceTree.app
Spectacle.app
Spotify.app
Skype.app
TeamViewer.app
Todoist.app
TogglDesktop.app
Upterm.app
Visual Studio Code.app
VLC.app
WebStorm.app
Wireshark.app
Xcode.app
Zeplin.app
iTerm.app
ngrok
```

### .zshrc (oh-my-zsh, antigen)
```
export ZSH=/Users/${user}/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

# install fonts: https://github.com/powerline/fonts

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

plugins=(osx,zsh-autosuggestions,zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

...
# aliases - 
alias cl='clear'
alias ll='ls -alhF'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias gs='git status'
alias gp='git push'
alias gm='git merge'
alias gl='git pull'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gc='git cz'
alias gbnm='git branch --no-merged'
alias ga='git add'
alias gaa='git add --all'
alias xtar='tar -xvzf'
alias ctar='tar -cvzf'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias port8080='lsof -n -i:8080 | grep LISTEN'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias canon='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
alias kall='killall grunt gulp node'
...

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```

# More
https://github.com/nikitavoloboev/my-mac-os
