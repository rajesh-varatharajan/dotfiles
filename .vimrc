""" Vundle Entries
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins here:
"
" shortnames come from http://github.com
" long names could include a git repo URL
"
" Run :PluginInstall! to install/update bundles
"
" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'mileszs/ack.vim'
"Plugin 'ervandew/supertab'
"Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'majutsushi/tagbar'
  nmap <F4> :TagbarToggle<CR>

Plugin 'airblade/vim-gitgutter'
  let g:gitgutter_sign_column_always = 0

Plugin 'vim-scripts/The-NERD-tree'
  let NERDTreeWinPos = 'left'
  map <F3> :NERDTreeToggle<CR>
  nnoremap <Leader>ff :NERDTreeFind<CR>

" YouCompeleteMe requires vim 7.3+
" Plugin 'Valloric/YouCompleteMe'

Plugin 'kien/ctrlp.vim'
  let g:ctrlp_working_path_mode = 0 " dont manage working directory.
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\c\.(git|svn)$',
  \ 'file': '\v\c\.(swf|bak|png|gif|mov|ico|jpg|pdf)$',
  \ }

Plugin 'Lokaltog/vim-powerline'
  let g:Powerline_symbols = 'fancy'
  highlight clear SignColumn

Plugin 'tpope/vim-surround'
Plugin 'joonty/vdebug'

" lang specific modules
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'hhvm/vim-hack'
"Plugin 'alvan/vim-php-manual'
"Plugin 'c9s/perlomni.vim'

call vundle#end()
filetype plugin indent on     " required!

"Use plug.vim to install additional plugins
call plug#begin('~/.vim/plugged')

" this assumes fzf is installed separately on ~/.apps/fzf
" see https://github.com/junegunn/fzf
Plug '~/.apps/fzf' | Plug 'junegunn/fzf.vim'
  noremap <C-T> :Files<CR>
  noremap <Leader>t :Buffers<CR>

call plug#end()

""" vimrc resumes
set shell=bash
set autoindent
set backspace=indent,eol,start
set nowrap
set number
set ruler
set scrolloff=5
set cmdheight=2
set cursorcolumn
set cursorline
set errorformat=\"../../%f\"\\,%*[^0-9]%l:\ %m
set hidden
set hlsearch
set noignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:-
set expandtab
set shiftwidth=4
set smarttab
set cindent
"set smartindent
set showcmd
set showmatch
set t_Co=256
set tags=tags;/
set virtualedit=block
"set mouse=n
"set ttymouse=xterm2
set backupdir=~/tmp
set wildmenu
set wildignore=*.exe,*.dll,*.o,*.so,*.pyc,*.back,*.jpg,*.jpeg,*.png,*.gif,*.pdf
set wildmode=list:full
set colorcolumn=80

syntax on
colorscheme colorfulnight


" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <C-L> :noh<CR><C-L>
inoremap jj <Esc>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader><Leader>r :e ~/.vimrc<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gm :Gcommit --amend<CR>
map <Leader>gll :Git log<CR>
map <Leader>glp :Git log -p<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gdd :Git diff<CR>
map <Leader>gdm :Git diff %<CR>
map <Leader>gdf :Gdiff<CR>
map <Leader>gg :Git 

nmap <F1> <Esc>
imap <F1> <Esc>

nnoremap <C-S-K> :m .-2<CR>==
nnoremap <C-S-J> :m .+1<CR>==
inoremap <C-S-J> <Esc>:m .+1<CR>==gi
inoremap <C-S-K> <Esc>:m .-2<CR>==gi
vnoremap <C-S-K> :m '<-2<CR>gv=gv
vnoremap <C-S-J> :m '>+1<CR>gv=gv
vnoremap // y/<C-R>"<CR>
