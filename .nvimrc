set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'LnL7/vim-nix'
Plugin 'idris-hackers/idris-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc', {'build': { 'mac': 'make' } }
Plugin 'Shougo/vimshell'

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

colorscheme solarized
syntax on
set background=dark

set laststatus=2
set backspace=indent,eol,start

set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

autocmd FileType ruby autocmd BufWritePre <buffer> StripWhitespace
autocmd FileType sh autocmd BufWritePre <buffer> StripWhitespace
au FileType gitcommit set tw=72

" size of a hard tabstop
set tabstop=2

" size of an 'indent'
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

set colorcolumn=80
set columns=80

if has('autocmd')
  au BufRead,BufNewFile *.md set spell wm=2 tw=79 linebreak
  au BufRead,BufNewFile *.adoc set spell wm=2 tw=79 linebreak
  au BufRead,BufNewFile *.markdown set spell wm=2 tw=79 linebreak
  au BufRead,BufNewFile *.idr setfiletype idris
  au FileType make set noexpandtab shiftwidth=8 softtabstop=0
endif

" idris defaults
let g:idris_indent_if = 3
let g:idris_indent_case = 5
let g:idris_indent_let = 4
let g:idris_indent_where = 6
let g:idris_indent_do = 3
let g:idris_indent_rewrite = 8

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
