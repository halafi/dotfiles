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
set nohidden
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
command! Reload execute ":source ~/.config/nvim/init.vim"

""" Native mappings
" Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" move single lines with ctrl shift arrow
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp
map [b :bp<CR>
map ]b :bn<CR>
map bd :bd<CR>
" Leader
inoremap jj <Esc>
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

"swtich between numbering
:set nornu
:set number
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
":  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
":augroup END

""" Plugins
call plug#begin("~/.vim/plugged")
filetype plugin indent on    " required for nerdcommenter
"Plugin Section
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
"Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Scrollbar
Plug 'Xuyuanp/scrollbar.nvim'
"NERDTree File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Commenter
Plug 'preservim/nerdcommenter'
"Snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
"Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim' "Toggle with :GitBlameToggle
" diff view of all changes
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
"Fuzzy finder, search of all things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim' "Search text in all files alternative to :Ag
"Editorconfig
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
"Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jiangmiao/auto-pairs' "auto pair for backets
"Syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ap/vim-css-color' "preview colors in code
"Text Objects and stuff
Plug 'machakann/vim-sandwich' "e.g. 'saiw(' makes foo to (foo)
"Nicesies
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/copypath.vim'
Plug 'can3p/incbool.vim' " Toggle true/false
Plug 'machakann/vim-highlightedyank'

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
"Theming support
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
let g:airline_theme = 'codedark'


"Use :Prettier
function! FormatFile()
  "call CocAction('runCommand', 'editor.action.organizeImport')
  call CocAction('runCommand', 'prettier.formatFile')
  call CocAction('runCommand', 'eslint.executeAutofix')
endfunction
command! -nargs=0 Fmt :CocCommand prettier.formatFile
command! -nargs=0 Fix :CocCommand eslint.executeAutofix
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 Ori :call CocAction('runCommand', 'editor.action.organizeImport')
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

" CoC - conqueror of completion
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets', 'coc-pairs']
"tab and shift tab navigation during completion
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" tab selects first item
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <c-space> to trigger completion.
inoremap <expr> <C-c> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"GoTo code navigation
nmap <leader>g <C-o>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

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
"find current file with
nmap ,n :NERDTreeFind<CR>


"file search config
"Easy bindings for CtrlP various modes
let g:ctrlp_working_path_mode = 'r'
nmap <leader>fl :Files<CR>
nmap <leader>bl :Buffers<CR>
nmap <leader>ml :Marks<CR>
nmap <leader>s :Rg<cr>
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
"ignore node modules
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
"ctrlsf
"use regex
"nmap <leader>ar :CtrlSF -R ""<Left>
"use regex and insensitive
nmap <leader>a :CtrlSF -R -I ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W -I<CR>
nmap <leader>aa :Commands<CR>
let g:ctrlsf_default_root = 'project'

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
" fugitive
nmap <leader>gs :G<CR>
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
" fzf git
nmap <leader>cl :Commits<CR>
nmap <leader>bcl :BCommits<CR>
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
" highlightedyank
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
" copypath
nnoremap <leader>cp :CopyPath<Cr>
