set nocompatible              " be iMproved, required
filetype off                  " required

"sjggkggkk set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'jeetsukumaran/vim-buffergator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginIkkkkkkjkjkjjkkkkjjjnstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set wildignore=*.swp
set visualbell
set noerrorbells
autocmd Filetype python setlocal expandtab shiftwidth=4 tabstop=4
autocmd Filetype php setlocal expandtab

set pastetoggle=<F3>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syntax enable " enable syntax processing

set foldenable

"move vertically by visual line
nnoremap j gj
nnoremap k gk

map <F4> :lclose<cr>

nnoremap <CR> i<CR><Esc>

map <down> 20j
map <up> 20k

let mapleader=","

" Map CtrlP to leader-p
nmap <leader>p :CtrlP<cr>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" CtrlP settings
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**
set wildignore+=*/static/**
set wildignore+=*/*django*/**

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\.py$']

" ESLint settings for Syntastic

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
" End Syntastic settings

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <F2> :NERDTreeToggle<CR>

" Settings for molokai theme
let g:rehash256 = 1
colorscheme Molokai

" Python-mode plugin settings

let g:pymode_rope = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>k'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

let g:pymode_lint_write = 1

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
