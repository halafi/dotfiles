# disable greeting
set fish_greeting

if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
end

for gcloud_path in \
        /opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/path.fish.inc \
        /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc \
        /usr/local/Caskroom/gcloud-cli/latest/google-cloud-sdk/path.fish.inc \
        /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    if test -f $gcloud_path
        source $gcloud_path
        break
    end
end

if type -q bass; and test -f "$HOME/.nvm/nvm.sh"
    load_nvm > /dev/stderr
end

set -gx GPG_TTY (tty)

fish_add_path "$HOME/.local/bin"
