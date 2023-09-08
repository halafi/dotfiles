# dotfiles

Update: currently migrating to VSCODE + VIM plugin as I got tired of maintaining Neovim running properly.
Also since I could never really got rid of doing certain things in VSCode such as debugging, jupyter notebooks, etc.

At the moment removed LSP config as I prefer to have Neovim as stable text editor rather than IDE.

My dotfiles for Neovim, tmux, fish and everything configurable.
Setup for web development (React with TypeScript), Go, Lua and Rust on macOS Monterey (LSP config no longer maintained).

Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am using [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

- [Fish](https://github.com/fish-shell/fish-shell) 🐟 with [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)

- [tmux](https://github.com/tmux/tmux) (no session management at the moment)

- [lazygit](https://github.com/jesseduffield/lazygit) to give some GUI to git commands

- [goku](https://github.com/yqrashawn/GokuRakuJoudo/) + [karabiner elements](https://karabiner-elements.pqrs.org/) for making 60% keyboard layout usable

- [asdf](https://github.com/asdf-vm/asdf) to manage language versions

<!-- - [Finicky](https://github.com/johnste/finicky) as default browser proxy to separate work from personal browsing -->

## Dependencies

### System

1. Install [brew](https://brew.sh/)
2. Install fish: `brew install fish`
3. Install [omf](https://github.com/oh-my-fish/oh-my-fish) and `omf install z`
4. [Tmux plugin manager](https://github.com/tmux-plugins/tpm) (q+i to install plugins)
5. Brew packages:
    - `brew install asdf fish exa fzf fd bat git-delta ripgrep neovim tmux lf yarn htop lazygit google-cloud-sdk terraform`
6. Install [FiraCode font patched with icons](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/FiraCodeNerdFont-Retina.ttf) for iTerm

### Git
1. Generate and setup ssh key if needed https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Neovim
1. Install packer: https://github.com/wbthomason/packer.nvim#quickstart

### ⌨️ Keyboard
1. install karabiner `brew install karabiner-elements`
2. install goku `brew install yqrashawn/goku/goku`
    - `softwareupdate --install-rosetta` if needed for goku
3. make sure karabiner profile is named `Default`
4. run `goku` once to generate karabiner config

<!-- ### Neovim Markdown Preview Dependencies
1. `brew install pandoc`
2. `npm i -g live-server` -->

### Node.js
1. `asdf plugin add nodejs`
2. `asdf install nodejs 18.xx.x` (latest lts)
3. update `.tool-versions` by running `asdf global nodejs 16.xx.x` (latest lts)

### Go
1. Install [Go](https://go.dev/doc/install)

### Rust / Cargo
1. https://doc.rust-lang.org/cargo/getting-started/installation.html

### Elixir
1. `asdf plugin add elixir`

### Python
1. `brew install pyenv`
<!-- 2. optional `yarn global add pyright` -->

## FAQ
1. How to fix broken `asdf` shims after brew update?

```
rm ~/.asdf/shims/*
asdf reshim
```

Source: https://github.com/asdf-vm/asdf/issues/1103#issuecomment-990795248

2. Where to get fonts?

https://www.nerdfonts.com/font-downloads

3. How to chagne default shell to fish?

https://stackoverflow.com/a/26321141

4. How to setup git key signing with gpg?

- `brew install gpg`
- https://jamespanther.com/writings/signing-github-commits-using-keybase/
