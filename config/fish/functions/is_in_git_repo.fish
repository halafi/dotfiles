function is_in_git_repo --description 'Check if current directory is a Git repo'
    git rev-parse HEAD >/dev/null 2>&1
end
