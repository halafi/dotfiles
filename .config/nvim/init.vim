set hlsearch
set incsearch
set nocursorline
" https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
set undodir=~/.vim/undodir
" allow buffer switching without saving
set hidden
" GCase insensitive search.
set ic
" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile

" Map jj as ESC since it's faster
inoremap jj <Esc>
" Map Leader to Space
nnoremap <SPACE> <Nop>
":verbose map <leader>
let mapleader=" "

let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin("~/.vim/plugged")
filetype plugin indent on    " required for nerdcommenter
"Plugin Section
Plug 'dracula/vim'
"Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Scrollbar
Plug 'Xuyuanp/scrollbar.nvim'
"NERDTree File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Commenter - https://github.com/preservim/nerdcommenter#default-mappings toggle with: [count]<leader>c<space>
Plug 'preservim/nerdcommenter'
"Snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
"Git
Plug 'tpope/vim-fugitive' " :GBrowse ftw
Plug 'tpope/vim-rhubarb' "new
Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim' "Toggle with :GitBlameToggle
"Fuzzy finder, search of all things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim' "Search text in all files alternative to :Ag
"Editorconfig
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
"Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ap/vim-css-color' "preview colors in code
"Plug 'jparise/vim-graphql'  -- uncomment when needed
"Plug 'tpope/vim-markdown' -- uncomment when needed
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Auto Pairs
Plug 'jiangmiao/auto-pairs' "auto pair for backets
Plug 'machakann/vim-sandwich' "e.g. 'saiw(' makes foo to (foo)
"Nicesies
Plug 'bogado/file-line' "I could probably live without it
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kshenoy/vim-signature' " :SignatureToggle - commands: https://github.com/kshenoy/vim-signature#installation
"Plug 'flazz/vim-colorschemes' "redundant colors

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
"Defaults for new projects
set tabstop=2 shiftwidth=2 expandtab
"Theming support
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
"Use :Prettier
function! FormatFile()
  call CocAction('runCommand', 'prettier.formatFile')
  call CocAction('runCommand', 'eslint.executeAutofix')
endfunction
command! -nargs=0 Fmt :CocCommand prettier.formatFile
command! -nargs=0 Fix :CocCommand eslint.executeAutofix
"format + fix
nmap <leader>ff :call FormatFile()<CR> 
"open new split panes to right and below
set splitright
set splitbelow
"Terminal toggle to normal mode with escape
tnoremap <Esc> <C-\><C-n>
"start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 20
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" Disable line numbers in :term
" https://stackoverflow.com/a/63908546
autocmd TermOpen * setlocal nonumber norelativenumber

"Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "horizontal"

"CoC - conqueror of completion
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets', 'coc-pairs']
"map ctrl-g ctrl-r
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"tab and shift tab navigation during completion
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()
"enter selects first item
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"GoTo code navigation
nmap <leader>g <C-o>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
"Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Toggle with CTRL + B
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"file search config
"Easy bindings for CtrlP various modes
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :FZF<cr>
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>s :Ag<cr>
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
"ignore node modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"ctrlsf
"nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>aa :Commands<CR>
"nmap <leader>c :CtrlSFFocus<CR>
"nmap <leader>C :CtrlSFToggle<CR>

if has("macunix")
  let g:ctrlsf_ackprg = '/usr/local/bin/ag'
elseif has("unix")
  let g:ctrlsf_ackprg = '/usr/bin/ag'
endif

let g:ctrlsf_winsize = '33%'
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }
"Scrollback
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
"Git
let g:gitblame_enabled = 0
"Typescript highlight
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"vim-jsx-typescript
"dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
hi tsxCloseTag guifg=#E06C75
"orange
hi tsxCloseString guifg=#E06C75
hi tsxCloseTagName guifg=#E06C75
hi tsxAttributeBraces guifg=#E06C75
hi tsxEqual guifg=#E06C75
"yellow
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
"swtich between numbering
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
"Utilities
"Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
"highlightedyank
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
