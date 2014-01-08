 " runtime flavors/bootstrap.vim
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" my configure
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"set noimdisable
"set iminsert=0
"set imsearch=0
"set noswapfile
set backspace=indent,eol,start

"custom maps 
:map <C-o> :CommandT<CR>
:let mapleader = ","
map <Leader>t :call RunCurrentSpecFile()<CR>

syntax enable

let g:user_zen_settings = {
  \  'indentation' : '  '
  \}
let g:indent_guides_guide_size = 1

if has("gui_running")
colorscheme desert
  set bs=2
    set ruler
      set gfn=Monaco:h16
  set shell=/bin/bash
endif

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'

Bundle 'tpope/vim-rvm'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mattn/zencoding-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'wincent/Command-T'
" indent guides
" Bundle 'nathanaelkane/vim-indent-guides'

" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
