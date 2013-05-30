set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'

" buffer navigator
Bundle 'duff/vim-bufonly'
Bundle 'fholgado/minibufexpl.vim'

" tag search
Bundle 'majutsushi/tagbar'

" file finder 
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'

" code completion & formatting
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-endwise'

" syntax checking
Bundle 'scrooloose/syntastic'
Bundle 'hallettj/jslint.vim'

" file types
Bundle 'johnantoni/nginx-vim-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'johnantoni/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'

" powerline
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'stephenmckinney/vim-solarized-powerline'

filetype plugin indent on   " required!

compiler ruby " Enable compiler support for ruby
syntax on " Enable highlighting for syntax
let mapleader=","

" -------------------------------------------

map <leader>d dd
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>

map <Leader>h :CommandT<CR>
map <Leader>j :CommandT app/assets/javascripts<CR>
map <Leader>rf :CommandTFlush<CR>:CommandT<CR>

map <leader>b :MiniBufExplorer<cr>
map <leader>B :BufOnly<CR>

nmap <leader>n :NERDTreeToggle<CR>

map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
map <Leader>ra :%s/
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>so :so %<cr>
map <Leader>vi :tabe ~/.vimrc<CR>

nmap <Leader>sn :e ~/Dropbox/notes/coding-notes.txt<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <Leader>x :exec getline(".")<cr>

" toggle splits
map <Leader>w <C-w>w

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" command typos
command! Q q
command! W w
nnoremap ; :
nnoremap <Leader><Leader> :

" dash twice for underscore
imap -- _

" quit
nmap <leader>q :q!<CR>
nmap <C-c> :q<CR>

" new tab
map <C-t> <esc>:tabnew<CR>

" ctrl save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" exit insert mode
imap jj <Esc>

" goto end of line
imap <C-l> <esc>$a

" move up/down long lines
nmap k gk
nmap j gj

" unhighlight search
nmap <silent> ,/ :nohlsearch<CR>

" toggle paste formatting off/on
set pastetoggle=<F2>

" copy and paste to system clipboard
map <leader>v "*p<CR>:exe ":echo 'pasted from clipboard'"<CR>
map <leader>c "*y<CR>:exe ":echo 'copied to clipboard'"<CR>

" find in files
map <leader>a :grep<space>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" save file with needing sudo rights
cmap w!! w !sudo tee % >/dev/null

" -------------------------------------------

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500 " keep 500 lines of command line history
set undolevels=500 " keep our undo history vast
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
set autoindent " always set indenting on
set showmatch
set autoread " read an externally changed file automatically without prompting
set wmh=0
set viminfo+=!
set guioptions-=T
set et
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
set iskeyword-=_ " use _ as a word_separator
set completeopt=menu,menuone,longest " complete options (disable preview scratch window)
set pumheight=15 " limit popup menu height
set showmatch
set incsearch " allow incremental search
set hlsearch
set wrap " wrap long lines
set linebreak " don't break words when wrapping lines
set nolist  " list disables linebreak

" fix mouse support inside tmux
set ttymouse=xterm2

" faster terminal rendering
set ttyfast

" (Hopefully) removes the delay when hitting esc in insert mode
set timeoutlen=1000 ttimeoutlen=-1

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

set swapfile
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set shell=zsh " use ZSH
set grepprg=ag " Use Silver Searcher instead of grep

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**,.gitkeep
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,Gemfile.lock
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**

set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" -------------------------------------------

let g:netrw_cursor = 0

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

source ~/.dotfiles/vim-config/plugins.vim
source ~/.dotfiles/vim-config/functions.vim

set t_Co=256
set background=light

let g:solarized_termcolors=256
colorscheme solarized

let g:Powerline_symbols='fancy'
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_light'

" enable mouse mode even in terminal vim
set mouse=a

if has("gui_running")
  set transparency=0
  set lines=90 columns=200
  set mouse=a
  set background=dark
endif
