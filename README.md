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

### iTerm2 && ZSH

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

### Applications (TODO filter, format)
```
Alfred 3.app
Amphetamine.app
App Store.app
Automator.app
Beam.app
Boostnote.app
Brackets.app
Caffeine.app
Calculator.app
Calendar.app
Chess.app
Commander One.app
Contacts.app
Cypress.app
DVD Player.app
Dash.app
Dashboard.app
Dictionary.app
FaceTime.app
Festify.app
Firefox.app
Flux.app
Font Book.app
Framer.app
Franz.app
Google Chrome Canary.app
Google Chrome.app
Hyper.app
Image Capture.app
ImageOptim.app
Keybase.app
Keyboard Maestro.app
Keynote.app
Launchpad.app
MacVim.app
Mail.app
Maps.app
Messages.app
Microsoft Remote Desktop.app
Mission Control.app
Monit.app
Monosnap.app
NotePlan.app
Notes.app
Numbers.app
Numi.app
Pages.app
Photo Booth.app
Photos.app
PingPlotter.app
Preview.app
PyCharm.app
QuickTime Player.app
Reminders.app
Safari.app
Screenhero.app
Simplenote.app
Sip.app
Siri.app
Sketch.app
Skype.app
Slack.app
SourceTree.app
Spectacle.app
Spotify.app
Stickies.app
System Preferences.app
TeamViewer.app
TextEdit.app
Time Machine.app
Todoist.app
TogglDesktop.app
Utilities
Visual Studio Code.app
WatchGuard
WebStorm.app
Wireshark.app
Zeplin.app
iBooks.app
iTerm.app
iTunes.app
ngrok
pgAdmin 4.app
zoom.us.app
```
