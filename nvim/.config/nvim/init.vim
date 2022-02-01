" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
call plug#end()

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" the copy goes to the clipboard
set clipboard+=unnamedplus

" no swap file
" set noswapfile
" set the directory where the swap file will be saved
" set backupdir=$VIMCONFIG/backup
" set directory=$VIMCONFIG/swap

" save undo trees in files
" set undofile
" set undodir=$VIMCONFIG/undo

" number of undo saved
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

syntax on

" set line number
set number

" use 4 spaces instead of tab (to replace existing tab use :retab)
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" when at 3 spaces, and I hit > ... indent of 4 spaces in total, not 7
set shiftround

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" doesn't prompt a warning when opening a file and the current file was modified but not saved 
set hidden

" Keep cursor more in middle when scrolling down / up
set scrolloff=999

" write automatically when quitting buffer
set autowrite

" relative / hybrid line number switch
set number relativenumber

" for vertical pane in git diff tool
set diffopt+=vertical
