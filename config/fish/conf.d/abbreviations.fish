if status --is-interactive
    abbr -a -g mkdir 'mkdir -p'
    abbr -a -- - 'cd -'
    abbr -a -- .. 'cd ..'
    abbr -a -- ... 'cd ../..'
    abbr -a -- ls exa
    abbr -a -- ll 'exa -alhF --git'

    abbr -a -- yarnup 'yarn upgrade-interactive --latest'

    abbr -a -g b brew
    abbr -a -g bi 'brew install'
    abbr -a -g bu 'brew uninstall'
    abbr -a -g brewup 'brew update && brew upgrade && brew prune && brew cleanup && brew doctor'

    abbr -a -g ext 'exa --tree --level'

    abbr -a -g tma 'tmux attach'
    abbr -a -g tls 'tmux list-sessions'
    abbr -a -g td 'tmux detach'
    abbr -a -g ta 'tmux attach-session -t'
    abbr -a -g tn 'tmux new-session -s'
    abbr -a -g tksv 'tmux kill-server'
    abbr -a -g tkss 'tmux kill-session -t'

    abbr -a -g canon 'open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'

    abbr -a -g g git
    abbr -a -g gc 'git cz'
    abbr -a -g gm 'git merge'
    abbr -a -g gco 'git checkout'
    abbr -a -g gcb 'git checkout -b'
    abbr -a -g gP 'git push'
    abbr -a -g gf 'git fetch'
    abbr -a -g gl 'git pull'
    abbr -a -g gs 'git status'
    abbr -a -g ga 'git add'
    abbr -a -g gb 'git branch'
    abbr -a -g gaa 'git add -all'
end
