 " runtime flavors/bootstrap.vim
 set term=xterm-256color
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my configure
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
"set noimdisable
"set iminsert=0
"set imsearch=0
"set noswapfile
set backspace=indent,eol,start
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set clipboard=unnamed

"custom maps
":map <C-o> :CommandT<CR>
let mapleader = ","
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'kien/ctrlp.vim'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

Plugin 'tpope/vim-rvm'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'vim-scripts/The-NERD-Commenter'
Plugin 'wincent/Command-T'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'jimenezrick/vimerl'
Plugin 'rizzatti/dash.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
" Snippet
"Plugin 'carlosgaldino/elixir-snippet'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
" Plugin 'honza/vim-snippets'
" indent guides
" Plugin 'nathanaelkane/vim-indent-guides'

" non-GitHub repos
" Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" ...

call vundle#end()            " required

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif

function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction

vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *

nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.py,*.js,*,rb :call <SID>StripTrailingWhitespaces()


" set background=dark
" colorscheme solarized
colorscheme grb256
nmap <leader>l :set list!<CR>
"set list listchars=tab:»·,trail:·
"set list listchars=tab:▸\ ,eol:¬,trail:·
set list listchars=tab:▸\ ,trail:·

"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

set hidden
set number


set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

function! InsertCommand(command)
    redir => output
    silent execute a:command
    redir END
    call feedkeys('i'.substitute(output, '^[\n]*\(.\{-}\)[\n]*$', '\1', 'gm'))
endfunction

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?


command -nargs=+ Iruby call InsertCommand("ruby " . <q-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


