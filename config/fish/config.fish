fish_add_path $GOBIN
fish_add_path $GOROOT/bin
fish_add_path /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
# pipx
fish_add_path ~/.local/bin
fish_add_path $HOME/.poetry/bin
fish_add_path $HOME/tools/lua-language-server/bin
fish_add_path $HOME/.cargo/bin
# output of $(yarn global bin)
fish_add_path /Users/halafi/.asdf/installs/nodejs/16.14.2/.npm/bin
fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/

eval "$(/opt/homebrew/bin/brew shellenv)"
source (brew --prefix asdf)/asdf.fish
fish_add_path $HOME/Library/Application\ Support/pypoetry/venv/bin

# disable greeting
set fish_greeting

# automatically call exa on cd
functions --copy cd standard_cd
function cd
    standard_cd $argv; and exa
end
