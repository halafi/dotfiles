if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set hlsearch
set incsearch
set nocursorline
" persistent undo https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
set undodir=$VIMCONFIG/undodir
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
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

set updatetime=1000
set ssop-=curdir
set ssop+=sesdir
set number
set nornu


nnoremap <SPACE> <Nop>
let mapleader=" "

" [s and ]s navigate, zg to add word to spell list, z= correct word
nnoremap <silent> <F3> :set spell!<CR>
inoremap <silent> <F3> <C-O>:set spell!<CR>
""" Custom Commands
command! Config execute ":e $VIMCONFIG/init.vim"
command! SnipTs execute ":e $VIMCONFIG/UltiSnips/typescript.snippets"
command! Reload execute ":source $VIMCONFIG/init.vim"
" :Rg but ignore filenames
command! -bang -nargs=* RG call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

""" Native mappings
" Substitute the word under the cursor.
nmap <leader>S :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" search and replace across files
" :grep "pizza"
" :cfdo %s/pizza/donut/g | update (update saves the file)
" or :bufdo %s/pizza/donut/g | update for open buffers

" move single lines with ctrl shift arrow
" noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
" noremap <c-s-down> ddp
map [b :bp<CR>
map ]b :bn<CR>
nnoremap <leader>bdd :w <bar> %bd <bar> e# <bar> bd# <CR>
"map bd :bd<CR>
" Leader
inoremap jk <Esc>
inoremap jj <Esc>
tnoremap jk <C-\><C-n>
tnoremap jj <C-\><C-n>

" disable search highlight
nnoremap <esc> :noh<return><esc>


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

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim' "Toggle with :GitBlameToggle
" diff view of all changes
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" Intellisense / Language support
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
    " JS / TS / React
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    " Lua
    Plug 'tjdevries/nlua.nvim'
    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"Text Objects and stuff
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
Plug 'tpope/vim-obsession'
Plug 'halafi/vim-test' " fork with nx runner
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" <C-w> v -> split, moving is handled by tmux
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
"Terminal toggle to normal mode with escape
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
"start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd TermOpen * setlocal nonumber norelativenumber

"Ultisnips
let g:UltiSnipsExpandTrigger="<leader>++"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "horizontal"

" nvim tree
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nmap ,n :NvimTreeFindFileToggle<CR>

" FZF
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fg <cmd>Rg<cr>
nnoremap <leader>fb <cmd>Buffers<cr>
nnoremap <leader>fh <cmd>Help<cr>
nnoremap <leader>aa <cmd>Commands<cr>
nmap <leader>s :Rg<cr>
nnoremap <C-p> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules,.git}"'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'

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

lua << EOF
require "lsp"
require "cmp-config"
require "treesitter"
require "lualine-config"
require "nvim-tree-config"
-- smaller plugins
require "trouble-config"
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
require "toggleterm-config"
require "indent-blankline-config"
require "colorizer-config"
EOF

" test
let g:test#custom_runners = {'javascript': ['nx']}
let g:test#strategy = "neovim"
let g:test#javascript#runner = 'nx'
let g:test#javascript#nx#project = 'app'

function! SwitchNxProject(project)
  let g:test#javascript#nx#project = a:project
endfunction

command! -nargs=1 NxProject :call SwitchNxProject(<f-args>)

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tnw :TestNearest --watch<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tfw :TestFile --watch<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tlw :TestLast --watch<CR>
nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tsw :TestSuite --watch<CR>

" highlight inactive terminal cursor position
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=gray guifg=black ctermbg =1 ctermfg = 15
