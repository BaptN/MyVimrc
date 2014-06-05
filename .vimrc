set nocompatible
filetype off
" Vundle call
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles list
"Snippets management
Bundle 'SirVer/ultisnips'
"Comment/uncomment your code easily
Bundle 'tomtom/tcomment_vim'
"Info lines in top and bottom of screen
Bundle 'bling/vim-airline'
"Git +/- bar near line numbers
Bundle 'airblade/vim-gitgutter'
"Exec git commands directly from vim
Bundle 'tpope/vim-fugitive'
" Colorscheme
Bundle 'flazz/vim-colorschemes'
"Autocompletion engine
Bundle 'Valloric/YouCompleteMe'
"Folder explorer
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/nerdtree-ack'
"Fuzzy file opener (inspired from ST2)
Bundle 'kien/ctrlp.vim'
"Registers management
Bundle 'vim-scripts/YankRing.vim'
"Multi cursor feature (inspired from ST2)
Bundle 'terryma/vim-multiple-cursors'
"Scratch buffer
Bundle 'mtth/scratch.vim'
" Color Themes
colorscheme molokai
" set background=dark

" Vim config
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
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
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
set number
set hlsearch
set ignorecase
set smartcase
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" do not history when leavy buffer
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview
let mapleader = ','

" Plugins config
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" Shortcuts
" Vim specifics :
" Buffers
nnoremap <C-g> :bnext<CR>
nnoremap <C-f> :bprevious<CR>
nnoremap <C-d> :call CleanClose()<CR>
" Undo, Redo
nnoremap <C-z>  :undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-z>  <Esc>:undo<CR>i
inoremap <C-y>  <Esc>:redo<CR>i
" Tabs
nnoremap <M-b>  :tabprevious<CR>
inoremap <M-b>  <Esc>:tabprevious<CR>i
nnoremap <M-n>  :tabnext<CR>
inoremap <M-n>  <Esc>:tabnext<CR>i
nnoremap <M-t>  :tabnew<CR>
inoremap <M-t>  <Esc>:tabnew<CR>i
nnoremap <M-k>  :tabclose<CR>
inoremap <M-k>  <Esc>:tabclose<CR>i
" Splitted windows
nnoremap <M-&> :vsp<CR>
nmap <silent> <M-Up> :wincmd k<CR>
nmap <silent> <M-Down> :wincmd j<CR>
nmap <silent> <M-Left> :wincmd h<CR>
nmap <silent> <M-Right> :wincmd l<CR>


" Plugins specifics
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" NERDTreeToggle
nnoremap <M-e> :NERDTreeToggle<CR>
inoremap <M-e> <Esc>:NERDTreeToggle<CR>i
" CtrlP => becomes AltO ;)
nnoremap <M-o> :CtrlP<CR>
inoremap <M-o> <Esc>:CtrlP<CR>
" Easy scratch
nnoremap <M-s> :Scratch<CR>
inoremap <M-s> <Esc>:Scratch<CR>
" Multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-a>'
let g:multi_cursor_prev_key='<C-s>'
let g:multi_cursor_skip_key='<C-q>'
let g:multi_cursor_quit_key='<Esc>'
" Git
noremap  <M-g> :GitGutterToggle<CR>
" YankRing
nnoremap <M-p> :YRShow<CR>

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



" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
