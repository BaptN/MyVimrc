set nocompatible
filetype off
" Vundle call
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins list
" Comment/uncomment your code easily
Plugin 'scrooloose/nerdcommenter'
" Info lines in top and bottom of screen
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git +/- bar near line numbers
Plugin 'airblade/vim-gitgutter'
" Colorscheme
" Plugin 'altercation/vim-colors-solarized'
" Autocompletion engine
Plugin 'Valloric/YouCompleteMe'
" Folder explorer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/nerdtree-ack'
" Fuzzy file opener (inspired from ST2)
Plugin 'kien/ctrlp.vim'
" Registers management
Plugin 'vim-scripts/YankRing.vim'
" Multi cursor feature (inspired from ST2)
Plugin 'terryma/vim-multiple-cursors'
" Syntax checking
Plugin 'scrooloose/syntastic'
" PHP
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'evidens/vim-twig'
Plugin 'thinca/vim-quickrun'
" Clojure
"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-leiningen'
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'guns/vim-clojure-highlight'
"Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'kana/vim-fakeclip'
call vundle#end()


" Vim config
filetype plugin indent on
syntax enable
set background=dark
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=LlRrb
set guioptions-=LlRrb
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list
set number
set hlsearch
set ignorecase
set smartcase
if has('mouse')
  set mouse=a
endif
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview
let mapleader = ','
autocmd FileType php set keywordprg=pman

" Plugins config
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

let FILETAG=expand("./tags")
if filereadable(FILETAG)
  set tags=tags
endif



" Shortcuts
" Vim specifics :
" Buffers
nnoremap <Leader>g :bnext<CR>
nnoremap <Leader>f :bprevious<CR>
nnoremap <Leader>d :call CleanClose()<CR>
" Splitted windows
nnoremap <leader>& :vsp<CR>
nmap <silent> <Leader>h :wincmd h<CR>
nmap <silent> <Leader>l :wincmd l<CR>

:map <Leader>i i_<Esc>r
:map <Leader>a a_<Esc>r

" Plugins specifics
" Use <Leader>L to clear the highlighting of :set hlsearch.
if maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l> :nohlsearch<CR>
endif
" NERDTreeToggle
nnoremap <Leader>e :NERDTreeToggle<CR>
inoremap <Leader>e <Esc>:NERDTreeToggle<CR>i
" CtrlP
nnoremap <Leader>p :CtrlP<CR>
inoremap <Leader>p <Esc>:CtrlP<CR>
" Multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<Leader>a'
let g:multi_cursor_prev_key='<Leader>s'
let g:multi_cursor_skip_key='<Leader>q'
let g:multi_cursor_quit_key='<Esc>'
" Git
noremap  <M-g> :GitGutterToggle<CR>
" YankRing
nnoremap <Leader>o :YRShow<CR>

" TODO : move to more appropriate place
function! CleanClose()
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd!".todelbufNr
endfunction

:command! Cs :e ~/Tools/MyVimrc/cheatsheet.md
:command! Vrc :e ~/.vimrc


let g:quickrun_config = {}

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
