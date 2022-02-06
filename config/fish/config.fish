set -x EDITOR nvim
set -x VISUAL nvim
set -x GOPATH $HOME/go-workspace
set -x GOBIN $GOPATH/bin
set -x GOROOT /usr/local/opt/go/libexec
set -x VIMCONFIG $HOME/.config/nvim
fish_add_path $GOBIN
fish_add_path $GOROOT/bin
fish_add_path /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
# pipx
fish_add_path ~/.local/bin
fish_add_path $HOME/.poetry/bin

# disable greeting
set fish_greeting

# automatically call exa on cd
# functions --copy cd standard_cd
# function cd
#     standard_cd $argv; and exa
# end

load_nvm > /dev/null
