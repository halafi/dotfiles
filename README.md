# Setup
## Chrome Extensions
### Development
* EditThisCookie https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en
* Injecta https://chrome.google.com/webstore/detail/injecta/gbndgddgajcmkogjonkgbcempddcbmca?hl=en
* JSON Viewer https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh
* Google Mail Checker https://chrome.google.com/webstore/detail/google-mail-checker/mihcahmgecmbnbcchbopgniflfhgnkff?hl=en
* Linkclump https://chrome.google.com/webstore/detail/linkclump/lfpjkncokllnfokkgpkobnkbkmelfefj?hl=en
* Postman https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en
* Project Naptha https://chrome.google.com/webstore/detail/project-naptha/molncoemjfmpgdkbdlbjmhlcgniigdnf
* Quick Tabs https://chrome.google.com/webstore/detail/quick-tabs/jnjfeinjfmenlddahdjdmgpbokiacbbb?hl=en
* Wappalyzer https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg?hl=en
* PerfectPixel https://chrome.google.com/webstore/detail/perfectpixel-by-welldonec/dkaagdgjmgdmbnecmcefdhjekcoceebi?hl=en
* Page Ruler https://chrome.google.com/webstore/detail/page-ruler/jlpkojjdgbllmedoapgfodplfhcbnbpn?hl=en
* React Developer Tools https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en
* Redux DevTools https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd?hl=en
* Vue.js devtools https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd?hl=en
### Other
* uBlock Origin https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm/related?hl=en
* The Great Suspender https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg?hl=en
* Streamkeys (music) https://chrome.google.com/webstore/detail/streamkeys/ekpipjofdicppbepocohdlgenahaneen?hl=en
* Stylish
* The Great Suspender

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
### Cask packages
* numi (epic calculator)
* caffeine (prevent sleep)
* dash (documentation)
* spectacle (window manager)

`brew cask install ...`

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

### Applications
```
Alfred 3.app
Amphetamine.app
Boostnote.app
Brackets.app
Caffeine.app
Commander One.app
Cypress.app
Dash.app
Firefox.app
Flux.app
Framer.app
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
Safari.app
Screenhero.app
Sip.app
Sketch.app
Slack.app
SourceTree.app
Spectacle.app
Spotify.app
TeamViewer.app
Todoist.app
TogglDesktop.app
Visual Studio Code.app
WebStorm.app
Wireshark.app
Zeplin.app
iTerm.app
ngrok
```

### .zshrc (oh-my-zsh, antigen)
```
export ZSH=/Users/${user}/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

plugins=(osx,zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting

...
aliases
...

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```
