set nocompatible              " be iMproved, required
filetype off                  " required

au BufRead,BufNewFile *.test set filetype=php

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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'amadeus/vim-mjml'
"Plugin 'dense-analysis/ale'
Plugin 'YPCrumble/ale'
Plugin 'leafgarland/typescript-vim'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'vitalk/vim-lesscss'
Plugin 'HerringtonDarkholme/yats'
Plugin 'sukima/xmledit'
Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set cindent
set smarttab
set number
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set wildignore=*.swp
set visualbell
set noerrorbells
set title
autocmd Filetype python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab 
autocmd Filetype javascript nnoremap <leader>k Odebugger;<Esc>
autocmd Filetype php nnoremap <leader>k Odpm(get_defined_vars());<Esc>
autocmd Filetype python nnoremap <leader>k Oimport pdb; pdb.set_trace()<Esc>

" Remove trailing whitespace from Python and Javascript files.
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.jsx :%s/\s\+$//e
autocmd BufWritePre *.ts :%s/\s\+$//e
autocmd BufWritePre *.tsx :%s/\s\+$//e

set pastetoggle=<F3>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap jk <Esc>

syntax enable " enable syntax processing

set foldenable

"move vertically by visual line
nnoremap j gj
nnoremap k gk

"use tab in normal mode to tab things.
nnoremap <Tab> I<Tab><Esc>

nnoremap <CR> i<CR><Esc>

map <down> 20j
map <up> 20k

let mapleader=","

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" SimpylFold settings
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**
set wildignore+=static/**
"set wildignore+=*/.git/*
let g:ctrlp_regexp = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
nnoremap <leader>. :CtrlPTag<cr>
"set wildignore+=*/django*/**
let g:ctrlp_prompt_mappings = {
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>', 'jk'],
  \ }

" Supertab settings
let g:SuperTabRetainCompletionDuration = "session"

" Ale settings
let g:ale_linters = { 
\ 'javascript': ['standard'],
\ 'javascriptreact': ['standard'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\ 'python': ['pylint', 'flake8', 'mypy']
\}
let g:ale_fixers = { 
\ 'javascript': ['standard'],
\ 'javascriptreact': ['standard'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\ 'python': ['black']
\}
let g:ale_lint_on_save = 1
let g:ale_open_list = 1
"let g:ale_typescript_standard_options = '--parser @typescript-eslint/parser --plugin @typescript-eslint/eslint-plugin'
"let g:ale_typescriptreact_standard_options = '--parser @typescript-eslint/parser --plugin @typescript-eslint/eslint-plugin'
"let g:ale_typescript_standard_options = {
"\ 'parser': '@typescript-eslint/parser',
"\ 'plugin': '@typescript-eslint/eslint-plugin'
"\}
function Py2()
  let g:ale_python_mypy_executable = 'mypy --py2'
endfunction

function Py3()
  let g:ale_python_mypy_executable = 'mypy'
endfunction

call Py3()   " default to Py3 because I try to use it when possible

let g:ale_python_mypy_options = '--ignore-missing-imports'
"let g:ale_python_pylint_options = "--disable=C0111 --load-plugins pylint_django"
let g:ale_python_black_options = '--line-length=79'
" let g:ale_fix_on_save = 1

" make F4 command close all quickfix and location lists.
noremap <F4> :windo lclose

" Automatically close the location list when the buffer closes
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Virtualenv settings
let g:virtualenv_auto_activate = 1

map <F2> :NERDTreeToggle<CR>

" Settings for molokai theme
let g:rehash256 = 1
colorscheme Molokai

" DelimitMate settings
let g:delimitMate_expand_cr = 2

"Vim-airline settings
let g:airline#extensions#tabline#enabled = 1
"Show tab number rather than number of splits in a tab.
let g:airline#extensions#tabline#tab_nr_type = 1

"let g:airline#extensions#ale#enabled = 1

"Search settings
"
" The Silver Searcher
" via https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ack.vim settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_autoclose = 1
let g:ackpreview = 1

" Lessc settings
" save css files to separate css folder (relative to original less location)
let g:lesscss_save_to = '../css/'
