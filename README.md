# dotfiles

I use VSCODE + VIM plugin as I got [tired of maintaining Neovim](https://filiphalas.com/from-neovim-back-to-vscode) running properly and since I could never really got rid of doing certain things in VSCode such as debugging, jupyter notebooks, etc.

My dotfiles for karabiner (60% keyboard layout), tmux, fish and everything configurable.
Setup for web development (React with TypeScript), Go, Lua and Rust on macOS Monterey.

Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am mostly using VSCode terminal these days with Tmux + Fish and [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

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
    - `brew install asdf fish exa fzf fd bat git-delta ripgrep tmux lf yarn htop lazygit google-cloud-sdk terraform`
6. Install [FiraCode font patched with icons](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/FiraCodeNerdFont-Retina.ttf) for iTerm

### Git
1. Generate and setup ssh key if needed https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### ⌨️ Keyboard
1. install karabiner `brew install karabiner-elements`
2. install goku `brew install yqrashawn/goku/goku`
    - `softwareupdate --install-rosetta` if needed for goku
3. make sure karabiner profile is named `Default`
4. run `goku` once to generate karabiner config

### Node.js
1. `asdf plugin add nodejs`
2. `asdf install nodejs 18.xx.x` (latest lts)
3. update `.tool-versions` by running `asdf global nodejs 16.xx.x` (latest lts)

### Go
1. Install [Go](https://go.dev/doc/install)
2. Adjust GO fish_variables if needed

### Rust / Cargo
1. https://doc.rust-lang.org/cargo/getting-started/installation.html

### Elixir
1. `asdf plugin add elixir`

### Python
1. `brew install pyenv`
<!-- 2. optional `yarn global add pyright` -->

## Alfred Workflows

- [Fkill](https://github.com/SamVerschueren/alfred-fkill)
- [Bluetooth Controller](https://github.com/vegardinho/alfred_bluetooth_controller)
- [Localhost](https://github.com/mhanberg/alfred-localhost)
- [VSCode Workspaces](https://github.com/phartenfeller/alfred-vscode-workspaces)
- [Alfred Emoji](https://github.com/jsumners/alfred-emoji)
- [Restart Wifi](https://github.com/AugustusZ/alfred-workflows)
- [Alfred NightShift](https://github.com/shmulvad/alfred-nightshift)
- [Switch Appearance](https://alfred.app/workflows/alfredapp/switch-appearance/)

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
