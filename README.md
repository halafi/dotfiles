# dotfiles

My dotfiles for Neovim, tmux, zsh and everything configurable.
Optimized for web development (React with TypeScript) and Go on macOS Monterey.
Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am using [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

- [Fish](https://github.com/fish-shell/fish-shell) 🐟 with [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)

- Neovim on its [master branch](https://github.com/neovim/neovim/commits/master)
  for programming, text editting, writing and medium-term note taking
  
- Neovim LSP client with several LSP servers installed

- [tmux](https://github.com/tmux/tmux) +
  [tmuxinator](https://github.com/tmuxinator/tmuxinator) to manage sessions

- [Ranger](https://github.com/ranger/ranger) for file management

- [lazygit](https://github.com/jesseduffield/lazygit)

## Dependencies

1. Brew packages:
    - `brew install exa fzf bat delta ripgrep neovim tmux tmuxinator ranger yarn htop autojump`
2. [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
3. LSP servers (used by Neovim): 
    - `yarn global add vscode-langservers-extracted`
    - `yarn global add typescript typescript-language-server eslint prettier`
    - `go install golang.org/x/tools/gopls@latest`
    - `https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/`
4. [nvm](https://github.com/nvm-sh/nvm)
5. OMF packages:
    - `z nvm`

