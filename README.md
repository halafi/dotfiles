# dotfiles

My dotfiles for Neovim, tmux, zsh and everything configurable.
Optimized for web development (React with TypeScript) on macOS Monterey.
Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Terminal

I am using [iTerm2](https://github.com/gnachman/iTerm2) for macOS.

- Zsh as my shell with [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

- Neovim on its [master branch](https://github.com/neovim/neovim/commits/master)
  for programming, text editting, writing and medium-term note taking
  
- Neovim LSP client with several LSP servers installed

- [tmux](https://github.com/tmux/tmux) +
  [tmuxinator](https://github.com/tmuxinator/tmuxinator) to manage sessions

- [Ranger](https://github.com/ranger/ranger) for file management

- [lazygit](https://github.com/jesseduffield/lazygit)

- VS Code or Github as mergetool

## Dependencies

1. Brew packages:
    - `brew install fzf bat delta ripgrep neovim tmux tmuxinator ranger spotify-tui yarn htop autojump`
2. [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
3. LSP servers: 
    - `yarn global add vscode-langservers-extracted`
    - `yarn global add typescript typescript-language-server eslint prettier`
4. [nvm](https://github.com/nvm-sh/nvm), will switch to: [zsh-nvm](https://github.com/lukechilds/zsh-nvm)

