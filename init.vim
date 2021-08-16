" nnoremap <SPACE> <Nop>
" let mapleader=" "
" absolute and relative line numbers
set nu rnu

let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin("~/.vim/plugged")
"Plugin Section
Plug 'dracula/vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"NERDTree File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


"File search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <SPACE> <Nop>


"intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()
"nvim +PlugInstall to install new

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

"enable theming support
if (has("termguicolors"))
 set termguicolors
endif

"theme
syntax enable
colorscheme dracula

"ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "horizontal"

"CoC - conqueror of completion
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" tab and shift tab navigation during completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle with CTRL + B
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Easy bindings for CtrlP various modes
let g:ctrlp_working_path_mode = 'r'
" Use also :Buffer, :Files, :History
nmap <leader>p :FZF<cr>

" https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" file search config
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" ignore node modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
