set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" my bundles
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'skalnik/vim-vroom'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-endwise'
Bundle 'mattn/gist-vim'
Bundle 'johnantoni/nginx-vim-syntax'
Bundle 'johnantoni/vim-powerline'
Bundle 'johnantoni/grb256'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'johnantoni/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on   " required!

compiler ruby " Enable compiler support for ruby
syntax on " Enable highlighting for syntax
let mapleader=","

" -------------------------------------------

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500 " keep 500 lines of command line history

set ruler  	" show the cursor position all the time
set cursorline " highlight current line
set number " show line numbers
set numberwidth=5 " change the width of the gutter column used for numbering
set showtabline=2 " show tab line
set showcmd  	" display incomplete commands
set scrolloff=3 " keep more context when scrolling off the end of a buffer
set laststatus=2  " Always show status line.
set cmdheight=2
set nofoldenable " Say no to code folding...

set autoindent
set showmatch
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et

set autoindent " always set autoindenting on
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅   "display tabs and trailing spaces
set sw=2
set softtabstop=2 " how many columns text is indented with the reindent operations
set tabstop=2 " set tab width to 2 spaces
set shiftwidth=2 " set number of space characters used for indentation
set expandtab " convert tabs to spaces
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set smarttab

set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line

set hidden " allow unsaved background buffers and remember marks/undo for them
set switchbuf=useopen,usetab " allow buffers to use open window/tab

set tags=./tags; " Set the tag file search order

" make the omnicomplete text readable
:highlight Pmenu ctermbg=238 gui=bold

set completeopt=menu,menuone,longest " complete options (disable preview scratch window)
set pumheight=15 " limit popup menu height

set showmatch
set incsearch " allow incremental search
set hlsearch

set wrap " wrap long lines
set linebreak " don't break words when wrapping lines
set nolist  " list disables linebreak

" (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1
set timeoutlen=500 " Don't wait so long for the next keypress (particularly in leader situations)

" set noesckeys " DO NOT ENABLE breaks normal vim's arrow keys in insert mode
set vb " no annoying sound on errors

" We have to have a winheight bigger than we want to set winminheight. But if we
" set winheight to be huge before winminheight, the winminheight set will fail.
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

set wildmenu " make tab completion for files/buffers act like bash
set wildmode=list:longest,full " use emacs-style tab completion when selecting files, etc

" keep backups (remember to create ~/.tmp dir)
set swapfile
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

set shell=zsh " use ZSH
set grepprg=ag " Use Silver Searcher instead of grep

set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" -------------------------------------------

" highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Set gutter background to black
highlight SignColumn ctermbg=black

" Remove underline on cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

let g:netrw_cursorline = 0

filetype plugin indent on " load indent files, to automatically do language-dependent indenting.

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,haml,coffee set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  "don't remember file position for git commits
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

  autocmd! BufRead,BufNewFile *.sass setfiletype sass
  autocmd! BufRead,BufNewFile *.lock setfiletype ruby
  autocmd! BufRead,BufNewFile *.pill setfiletype ruby
  autocmd! BufRead,BufNewFile *.json_builder setfiletype ruby

  "for haml_coffee_assets ~ https://github.com/netzpirat/haml_coffee_assets
  autocmd! BufRead,BufNewFile *.hamlc setfiletype haml

  autocmd BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.mobile.erb set filetype=eruby

  " Set up some useful Rails.vim bindings for working with Backbone.js
  autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
  autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  autocmd! BufRead,BufNewFile *.conf setfiletype nginx

  autocmd BufWritePre *.rb :%s/\s\+$//e " Remove trailing whitespace on save for ruby files.
  autocmd filetype svn,*commit* setlocal spell "spell check when writing commit logs
augroup END

source ~/.dotfiles/vim-config/keymaps.vim
source ~/.dotfiles/vim-config/functions.vim

let g:Powerline_symbols='fancy'

set t_Co=256 " enable 256 colors

if has("gui_running")
  set transparency=0
  set lines=90 columns=200
  set mouse=a "get full mouse support
  :color solarized
  :set guifont=Menlo:h13
  set background=dark
else
  " for iterm2 use ~/dotfiles/terminal-colors/solarized_dark.itermcolors
  :color grb256
  :set guifont=Menlo:h12
  set background=dark
endif
