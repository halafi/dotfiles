if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set hlsearch
set incsearch
set nocursorline
" persistent undo https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
set undodir=~/.config/nvim/undodir
" allow / disallow buffer switching without saving
set hidden
" case insensitive search
set ic
set nobackup
set nowritebackup
set noswapfile
set title
" soft wrap / break line on whole words
set linebreak
" Defaults for new projects
set expandtab
set tabstop=2
set shiftwidth=2
" Highlight spaces etc.
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" spell checker
set nospell spelllang=en_us
" [s and ]s navigate, zg to add word to spell list, z= correct word
nnoremap <silent> <F3> :set spell!<CR>
inoremap <silent> <F3> <C-O>:set spell!<CR>
""" Custom Commands
command! Config execute ":e ~/.config/nvim/init.vim"
command! Tsx execute ":e ~/.config/nvim/UltiSnips/typescript.snippets"
command! Reload execute ":source ~/.config/nvim/init.vim"

""" Native mappings
" Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" move single lines with ctrl shift arrow
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp
map [b :bp<CR>
map ]b :bn<CR>
"map bd :bd<CR>
map <leader>bc :%bd\|e#<cr>
" Leader
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

nnoremap <SPACE> <Nop>
let mapleader=" "

" fix: map S-Tab to ctrl+d in insert mode
:imap <S-Tab> <c-d>

let g:python3_host_prog = '/usr/local/bin/python3'

" share clipboard with os
if has("macunix") || has('win32')
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
endif
" mouse
if has('mouse')
  " https://vi.stackexchange.com/a/521
  set mouse=a
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

:set rnu
:set number

""" Plugins
call plug#begin("~/.vim/plugged")
filetype plugin indent on
" Themes
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'
" Fuzzy finder, search of all things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Editorconfig
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
" Status Bar, Tree
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'Xuyuanp/scrollbar.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim' "Toggle with :GitBlameToggle
" diff view of all changes
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" Intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" just some icons for autocomplete
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
" some uitls like rename file and update imports, import all missing imports etc.
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'windwp/nvim-ts-autotag'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"Text Objects and stuff
Plug 'machakann/vim-sandwich' "e.g. 'saiw(' makes foo to (foo)
Plug 'jiangmiao/auto-pairs' "auto pair for backets
" Nicesies
Plug 'mhinz/vim-startify'
Plug 'can3p/incbool.vim' " Toggle true/false
Plug 'machakann/vim-highlightedyank'
Plug 'folke/trouble.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary' 
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()


"Config Section
"window splitting / movement with ctrl + hjkl
function! WinMove(key)
   let t:curwin = winnr()
   exec "wincmd ".a:key
   if (t:curwin == winnr())
       if (match(a:key,'[jk]'))
           wincmd v
       else
           wincmd s
       endif
       exec "wincmd ".a:key
   endif
endfunction
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
nnoremap <silent> <C-q> :wincmd q<CR>
"Theming support
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

"open new split panes to right and below
set splitright
set splitbelow

"Ultisnips
let g:UltiSnipsExpandTrigger="<leader>++"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "horizontal"

" nvim tree
nnoremap <silent> <C-b> :NvimTreeToggle<CR>
nmap ,n :NvimTreeFindFileToggle<CR>

"FZF search
let g:ctrlp_working_path_mode = 'r'
nmap <leader>fl :Files<CR>
nmap <leader>bl :Buffers<CR>
nmap <leader>ml :Marks<CR>
nmap <leader>s :Rg<cr>
nnoremap <C-p> :Files<CR>
" fzf git
nmap <leader>cl :Commits<CR>
nmap <leader>bcl :BCommits<CR>
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
"ignore node modules
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
nmap <leader>aa :Commands<CR>

"Scrollback
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

" Git
" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gfd :Gdiffsplit<CR>
nmap <leader>gd :DiffviewOpen<CR>
nmap <leader>gcd :DiffviewClose<CR>
nnoremap <leader>gb :GBrowse!<Cr>

" mergetool
nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

" show blame
let g:gitblame_enabled = 0
vnoremap <leader>gbl :GitBlameToggle<Cr>
nnoremap <leader>gbl :GitBlameToggle<Cr>

" highlightedyank
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

let g:nvim_tree_icons = {
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   }
    \ }

:lua require('config')

" trouble
nnoremap <leader>ac <cmd>TroubleToggle<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
