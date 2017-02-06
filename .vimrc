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
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'klen/python-mode'
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
set expandtab
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
set title
autocmd Filetype python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype javascript nnoremap <leader>k Odebugger;<Esc>
autocmd Filetype php nnoremap <leader>k Odpm(get_defined_vars());<Esc>
autocmd Filetype python nnoremap <leader>k Oimport pdb; pdb.set_trace()<Esc>

autocmd BufWritePre *.py :%s/\s\+$//e

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

map <F4> :lclose<cr>

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
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**
set wildignore+=static/**
set wildignore+=*/django*/**

" Supertab settings
let g:SuperTabRetainCompletionDuration = "session"

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = {".test": "php"}

" Python settings for Syntastic

let g:syntastic_python_checkers=["flake8", "pep8", "pycodestyle", "pyflakes", "pylint"]

" Django settings for Syntastic
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
" Commented out because pylint_django doesn't currently support templates
"let g:syntastic_htmldjango_checkers = ['python/pylint']


" ESLint settings for Syntastic

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" HTML settings to silence bad tidy errors
"let g:syntastic_html_tidy_ignore_errors = [
    "\  'plain text isn''t allowed in <head> elements',
    "\  '<base> escaping malformed URI reference',
    "\  'discarding unexpected <body>',
    "\  '<script> escaping malformed URI reference',
    "\  '</head> isn''t allowed in <body> elements',
    "\  '<meta> isn''t allowed in <body> elements',
    "\  '<title> isn''t allowed in <body> elements',
    "\  '<link> isn''t allowed in <body> elements',
    "\  'content occurs after end of body'
    "\ ]

" End Syntastic settings

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <F2> :NERDTreeToggle<CR>

" Settings for molokai theme
let g:rehash256 = 1
colorscheme Molokai

"" Python-mode plugin settings

"let g:pymode_rope = 0

"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>k'

""Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"

"let g:pymode_lint_write = 1

"let g:pymode_syntax=1
"let g:pymode_syntax_all=1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

"Vim-airline settings
let g:airline#extensions#tabline#enabled = 1
"Show tab number rather than number of splits in a tab.
let g:airline#extensions#tabline#tab_nr_type = 1

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
