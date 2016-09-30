#!/usr/bin/env zsh

# Default function
repo-cleaner() {
    starting=$(pwd) #store the current directory, so we can come back to it
    echo "Finding repositories. This might take a minute ..."
    repo-cleaner-iterate $(find $HOME -name .git -type d)
    cd $starting # go back to the starting point
}

# Iterates through given folders
repo-cleaner-iterate() {
    reset="\033[0m"
    for folder in "$@";
    do
        cd "$folder/../"
        branch="$(git name-rev --name-only HEAD)"
        echo -e "${reset}====================================================================="
        echo "$(pwd) [$branch]"
        repo-cleaner-update
    done
}

# Updates all of the git stuff in a folder
repo-cleaner-update() {
    red="\033[01;31m"
    green="\033[0;32m"
    echo -e "$red"
    repo-cleaner-handle-remotes
    echo -e "$green"
    git prune
    git gc --aggressive
    git fsck --full
}

# Perform the fetching, pruning, and pulling of remotes
repo-cleaner-handle-remotes() {
    branch="$(git name-rev --name-only HEAD)"
    remotes=$(git remote)

    # Big assumption here, but I'm going with it for now
    git pull origin $branch
    for remote in $remotes
    do
        git fetch $remote
        git remote prune $remote
    done

}
