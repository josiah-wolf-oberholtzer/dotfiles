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
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol


" 2. settings (alphabetical)
" ==========================

set autoindent
set backspace=2
set background=light
set autoread
set clipboard=unnamed
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
set noeol
set nojoinspaces
set noswapfile
set notitle
set nowrap
set nowritebackup
set pastetoggle=<F2>
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set scrolloff=7
set spell
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
" =========================

" ctrlp (https://github.com/kien/ctrlp.vim)
let g:ctrlp_by_filename = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 2
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
map <leader>c :CtrlP $DEVPATH/consort<cr>
map <leader>d :CtrlP $HOME/Development/dissertation<cr>
map <leader>jj :CtrlP $ABJAD/abjad<cr>
map <leader>js :CtrlP $IDE<cr>
map <leader>jt :CtrlP $ABJAD<cr>
map <leader>jx :CtrlP $ABJAD/experimental<cr>
map <leader>s :CtrlP $SUPRIYA<cr>
map <leader>sa :CtrlP $SCORESPATH/armilla/armilla<cr>
map <leader>se :CtrlP $SCORESPATH/ersilia/ersilia<cr>
map <leader>sp :CtrlP $SCORESPATH/plague_water<cr>
map <leader>sz :CtrlP $SCORESPATH/zaira/zaira<cr>

" jedi-vim (https://github.com/davidhalter/jedi-vim)
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#related_names_command = "<leader>z"

" vim-airline (https://github.com/bling/vim-airline)
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''

" vim-pythontextobj (https://github.com/natw/vim-pythontextobj.git)
" provides these text objects: ac, ic, af, if
" no configuration required

" vim-surround (https://github.com/tpope/vim-surround.git)
" provides matchfix transform commands
" no configuration required

" vim-unimpaired (https://github.com/tpope/vim-unimpaired.git)
" provides bracket aliases for :previous, :next, :bprevious, :bnext, etc.
" no configuration required

" vim-syntastic (https://github.com/scrooloose/syntastic.git)
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--config=/Users/josiah/.config/flake8 --builtins=Up,Down,Center,Left,Right,Infinity,NegativeInfinity'
let g:syntastic_enable_signs=1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" 5. other
" ========

" show tab number (adapted from http://stackoverflow.com/q/5927952)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let wn = tabpagewinnr(i,'$')
            let s .= (i == t ? '%#TabNumSel#        ' : '%#TabNum#        ')
            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i == t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end
            let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set tabline=%!MyTabLine()
    highlight TabLineSel term=bold cterm=bold ctermfg=16 ctermbg=229
    highlight TabWinNumSel term=bold cterm=bold ctermfg=90 ctermbg=229
    highlight TabNumSel term=bold cterm=bold ctermfg=16 ctermbg=229
    highlight TabLine term=bold cterm=bold ctermfg=16 ctermbg=145
    highlight TabWinNum term=bold cterm=bold ctermfg=90 ctermbg=145
    highlight TabNum term=bold cterm=bold ctermfg=16 ctermbg=145
    highlight TabLineFill term=bold cterm=bold ctermbg=Black
endif

" show number of lines in fold
function! MinimalFoldText()
    let foldlinecount = 1 + v:foldend - v:foldstart
    if foldlinecount == 1
        let foldlinecountstring = " " . foldlinecount . " line folded "
    else
        let foldlinecountstring = " " . foldlinecount . " lines folded "
    endif
    return "+" . v:folddashes . foldlinecountstring
endfunction
set foldtext=MinimalFoldText()
highlight Folded term=standout ctermfg=Grey ctermbg=White guifg=DarkGrey guibg=LightGrey

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction
command WC call WC()

let g:tex_comment_nospell = 1
let g:LatexBox_Folding=1