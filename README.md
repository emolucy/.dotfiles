# My personal dotfiles

Here are all of my personal dotfiles. I mainly use arch linux, but sometimes I am on MacOS, and this repo
serves to keep my dotfiles synced between machines.

## Quick start
I personally use stow for my symlinking. To install my dotfiles, install GNU stow using your preferred package manager.

Then, do the following:
```
$ git clone https://github.com/emolucy/.dotfiles
$ cd .dotfiles
$ stow <CONFIG_NAME>
```

## Per-program setup

A few programs require their own setup.

1. [Tmux](./tmux/README.md)
2. [Neovim](./nvim/README.md)
