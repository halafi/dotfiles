function gho --description 'Open current Git branch in browser'
    if not is_in_git_repo
        exit 1
    end

    set -l url (git config --get remote.origin.url)
    set -l branch (git rev-parse --abbrev-ref --symbolic-full-name HEAD)
    if test $branch = HEAD
        set branch (git rev-parse HEAD)
    end

    set -l converted_url (echo "$url/tree/$branch" |
        sed 's|git@github.com:\(.*\)\.git|https://github.com/\1|')

    open "$converted_url"
end
