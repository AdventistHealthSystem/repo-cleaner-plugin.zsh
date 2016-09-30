# Repo Cleaner for Antigen and zsh

A Zsh plugin to do basic maintenance on all of a user's git repositories. This plugin is written to work with [Antigen](http://antigen.sharats.me/)

## Summary
The plugin will find all of the git repos inside a user's home folder, and iterate through each of them to do the following:
* git fetch all remotes
* git pull current remote, and current branch
* git prune all remotes
* git prune local
* git garbage collection (agressive)
* git fsck

## Installation
```
antigen bundle corycollier/repo-cleaner-plugin.zsh
```

## Usage
The script can be run as simply as `repo-cleaner`. This will, by default, search through the contents of the `$HOME` directory for any git repos to clean up. If you specify a `$REPOSITORY_DIR` variable, the script will only search that directory for updates (maxdepth 1)