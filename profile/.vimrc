" ========
" preamble
" ========

filetype indent on
filetype plugin on
let mapleader = ","
syntax on
autocmd BufWritePost * GitGutter
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2

" ========
" settings
" ========

set backspace=2
set clipboard^=unnamed
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=ack\ --nogroup\ --column\ --ignore-dir=build\ $*
set incsearch
set magic
set nobackup
set noswapfile
set nowrap
set nowritebackup
set nu
set scrolloff=7
set shiftwidth=4
set showmatch
set smartcase
set softtabstop=4
set tabstop=4
set wildmode=list:longest

" ========
" mappings
" ========

" window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" indentation 
vnoremap < <gv
vnoremap > >gv

" remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" =======
" plugins
" =======

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
let g:loaded_matchparen=1
