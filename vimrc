" 0. preamble
" ===========

autocmd! bufwritepost .vimrc source %
call pathogen#infect()
call pathogen#helptags()
filetype off
filetype plugin on
syntax on
let mapleader = ","

" 1. autocommands
" ===============

autocmd BufWinEnter *.py silent set foldenable
autocmd BufWinEnter *.py silent set foldlevel=1
autocmd BufWinEnter *.py silent set foldmethod=indent
autocmd BufWinEnter *.py silent set foldminlines=0
autocmd BufWinEnter *.py silent set foldnestmax=2
autocmd BufWinEnter *.py silent set nofoldenable

" 2. settings (alphabetical)
" ==========================

set autoindent
set backspace=2
set background=light
set autoread
set clipboard^=unnamed
set colorcolumn=80
set completeopt=menuone,preview
set encoding=utf-8
set expandtab
set fileencodings=utf-8,latin1
set grepformat=%f:%l:%c:%m
set grepprg=ack\ --nogroup\ --column\ --ignore-dir=build\ $*
set helpheight=80
set history=700
set ignorecase
set incsearch
set nobackup
set nojoinspaces
set noswapfile
set notitle
set nowrap
set nowritebackup
set pastetoggle=<F2>
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set scrolloff=7
set splitright
"set spell
set tabstop=4
set tags=$ABJADROOT/tags
"set textwidth=79
set undolevels=700
set wildignore+=*.pyc
set wildignore+=*/coverage/*
set wildignore+=*_build/*
set wildignore+=*.aux
set wildignore+=*.bbl
set wildignore+=*.blg
set wildignore+=*.log
set wildignore+=*.out
set wildignore+=*.toc
set wildignore+=*.ttf
set wildmode=list:longest

" 3. mappings (alphabetical)
" ==========================

" comments
noremap <F4> <Esc>:'a,'bs/#//<cr>
noremap <F6> <Esc>:'a,'bs/^/#/<cr>
vnoremap <F4> :s/#//<cr>
vnoremap <F6> :s/^/#/<cr>

noremap <F3> <Esc>:'a,'bs/%//<cr>
noremap <F7> <Esc>:'a,'bs/^/%/<cr>
vnoremap <F3> :s/%//<cr>
vnoremap <F7> :s/^/%/<cr>

noremap <F2> <Esc>:'a,'bs/\/\///<cr>
noremap <F8> <Esc>:'a,'bs/^/\/\//<cr>
vnoremap <F2> :s/\/\///<cr>
vnoremap <F8> :s/^/\/\//<cr>

" cursor vertical center
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>

" folding
noremap <leader>zm zMzr

" hjkl navigation only
" but note that arrow keys always work in paste mode
map   <Up>     <NOP>
map   <Down>   <NOP>
map   <Left>   <NOP>
map   <Right>  <NOP>

" indentation
vnoremap < <gv
vnoremap > >gv
map <leader>a ggVG

" linesort
vnoremap <leader>s :sort<cr>
noremap <leader>ab :'a,'bsort<cr>

" remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" settings reload & view
map <leader>v :source ~/.vimrc<cr>
map <leader>vv :edit ~/.vimrc<cr>

" window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" write & quit
noremap <leader>w :write<cr>
noremap <leader>q :quit<cr>
noremap <leader>wq :wq<cr>

" 4. plugins (alphabetical)
" " =========================

" ctrlp (https://github.com/ctrlpvim/ctrlp.vim)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
map <leader>a :CtrlP ~/Development/abjad<cr>
map <leader>d :CtrlP ~/Discogs/discogs<cr>
map <leader>i :CtrlP ~/Development/ide<cr>
map <leader>s :CtrlP ~/Development/supriya<cr>

" vim-airline (https://github.com/bling/vim-airline)
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''

" vim-syntastic (https://github.com/scrooloose/syntastic.git)
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_signs=1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
