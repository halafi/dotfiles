# Setup (update 08-2020)
## VSCode Plugins
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

## Chrome Extensions
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
#### Core
* antigen
* node
* postgresql
* wget
* yarn
* tig

#### Ad-hoc (not using much)
* fasd
* jq (json)
* colordiff
* htop
* the_silver_searcher (ag)
* httpie
* tree
* gotty (share your terminal as a web application)
* hh (search terminal history)

...

### Aliases
```
alias ll='ls -alhF'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcd='git checkout development'
alias gc='git cz'
alias ga='git add'
alias gaa='git add --all'
alias xtar='tar -xvzf'
alias ctar='tar -cvzf'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias port8080='lsof -n -i:8080 | grep LISTEN'jjjjjkj
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias canon='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
alias kall='killall grunt gulp node'
```

### Config
Faster keyboard repeat - needed for VIM users

```
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

### Applications
```
Alfred 4.app
Android Studio.app
Be Focused.app
Commander One.app
Cyberduck.app
Cypress.app
Discord.app
Docker.app
Firefox.app
Franz.app
Google Chrome Canary.app
Google Chrome.app
ImageOptim.app
Monosnap.app
NotePlan 2.app
Numi.app
Safari.app
# Sip.app - replaced by Monosnap
Slack.app
SourceTree.app
Spectacle.app
Spotify.app
Skype.app
Todoist.app
TogglDesktop.app
Visual Studio Code.app
VLC.app
WebStorm.app
Xcode.app
iTerm.app
Postico.app
Postman.app
qBittorrent.app
ngrok
```

### .zshrc (oh-my-zsh, antigen)
```
export ZSH=/Users/${user}/.oh-my-zsh

# install fonts: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Optional: type p10k configure to access the builtin configuration wizard right from your terminal.
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/antigen/antigen.zsh

plugins=(osx,zsh-autosuggestions,zsh-syntax-highlighting)

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

...
# aliases
# < PASTED FROM ABOVE >
...

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion```

# More
https://github.com/nikitavoloboev/my-mac-os
