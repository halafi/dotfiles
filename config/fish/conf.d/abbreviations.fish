if status --is-interactive
    abbr -a -- - 'cd -'
    abbr -a -- .. 'cd ..'
    abbr -a -- ... 'cd ../..'

    # abbr -a -- yarnup 'yarn upgrade-interactive --latest'

    abbr -a -g brewup 'brew update && brew upgrade && brew cleanup && brew doctor'

    abbr -a -g tma 'tmux attach'
    abbr -a -g tms 'tmux switch'
    abbr -a -g tmls 'tmux list-sessions'

    abbr -a -g gc 'git cz'
    abbr -a -g gm 'git merge'
    abbr -a -g gco 'git checkout'
    abbr -a -g gcb 'git checkout -b'
    abbr -a -g gP 'git push'
    abbr -a -g gf 'git fetch'
    abbr -a -g gl 'git pull'
    abbr -a -g gs 'git status'
    abbr -a -g ga 'git add'
    abbr -a -g gaa 'git add --all'
    abbr -a -g gb 'git branch'
end
