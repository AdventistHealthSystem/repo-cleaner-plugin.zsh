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