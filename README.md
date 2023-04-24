# dotfiles

My dotfiles for Neovim, tmux, fish and everything configurable.
Setup for web development (React with TypeScript), Go, Lua and Rust on macOS Monterey.
Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am using [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

- [Fish](https://github.com/fish-shell/fish-shell) 🐟 with [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)

- Neovim on its [master branch](https://github.com/neovim/neovim/commits/master)
  
- Neovim LSP client with several LSP servers installed

- [tmux](https://github.com/tmux/tmux) (no session management at the moment)

- [lazygit](https://github.com/jesseduffield/lazygit) to give some GUI to git commands

- [goku](https://github.com/yqrashawn/GokuRakuJoudo/) + [karabiner elements](https://karabiner-elements.pqrs.org/) for making 60% keyboard layout usable

- [asdf](https://github.com/asdf-vm/asdf) to manage language versions

- [Finicky](https://github.com/johnste/finicky) as default browser proxy to separate work from personal browsing

## Dependencies

### System

1. Install [brew](https://brew.sh/)
2. Install fish: `brew install fish`
3. Install [omf](https://github.com/oh-my-fish/oh-my-fish) and `omf install z`

### Dotfiles

1. Install packer: https://github.com/wbthomason/packer.nvim#quickstart
2. Install [FiraCode font patched with icons](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf)
3. Install [Go](https://go.dev/doc/install)
4. Brew packages:
    - `brew install asdf fish exa fzf fd bat git-delta ripgrep neovim tmux lf yarn htop lazygit lazydocker google-cloud-sdk terraform`
5. [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
6. LSP servers (used by Neovim): 
    - `yarn global add vscode-langservers-extracted`
    - `npm install -g svelte-language-server`
    - `yarn global add typescript typescript-language-server eslint prettier`
    - `go install golang.org/x/tools/gopls@latest`
    - `https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/`
    - `brew install rust-analyzer`

### ⌨️ Keyboard
1. install karabiner `brew cask install karabiner-elements`
2. install goku `brew install yqrashawn/goku/goku`
3. make sure karabiner profile is named `Default`
4. run `goku` once to generate karabiner config

### Markdown Preview Dependencies
1. `brew install pandoc`
2. `npm i -g live-server`

### Node.js
1. `asdf plugin add nodejs`
2. `asdf install nodejs lts`
3. update `.tool-versions` by running `asdf global nodejs 16.xx.x` (latest lts)

### Rust / Cargo
1. https://doc.rust-lang.org/cargo/getting-started/installation.html

### Elixir + LSP
1. `asdf plugin add elixir`
2. https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls

### Python + LSP
1. `yarn global add pyright`


## FAQ
1. How to fix broken `asdf` shims after brew update?

```
rm ~/.asdf/shims/*
asdf reshim
```

Source: https://github.com/asdf-vm/asdf/issues/1103#issuecomment-990795248

2. Where to get fonts?

https://www.nerdfonts.com/font-downloads
