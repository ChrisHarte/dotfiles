set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'ervandew/supertab'

" buffer management
Bundle 'duff/vim-bufonly'
Bundle 'fholgado/minibufexpl.vim'

" file managers
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'

" code completion
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tomtom/tcomment_vim'

" syntax checking
Bundle 'scrooloose/syntastic'

" file types
Bundle 'johnantoni/nginx-vim-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'slim-template/vim-slim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'

" powerline
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'stephenmckinney/vim-solarized-powerline'

" required
filetype plugin indent on

compiler ruby " Enable compiler support for ruby
syntax on " Enable highlighting for syntax


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
set ttymouse=xterm2 " fix mouse support inside tmux
set ttyfast " faster terminal rendering
set timeoutlen=1000 ttimeoutlen=-1 " remove delay when hitting esc in insert mode
set vb " no annoying sound on errors
set wildmenu " make tab completion for files/buffers act like bash
set wildmode=list:longest,full " use emacs-style tab completion when selecting files, etc
set swapfile
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set shell=zsh " use ZSH

" Use Silver Searcher instead of grep
set grepprg=ag

" Splits
set splitright
set splitbelow

set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)


" -------------------------------------------

let mapleader=","

map <leader>d dd
map <leader>f :CommandT<CR>

" show buffers
map <leader>b :MiniBufExplorer<cr>
" wipe buffers
map <leader>B :BufOnly<CR>

" comment out line or block
map <leader>cc :TComment<CR>
map <leader>cb :TCommentBlock<CR>

nmap <leader>n :NERDTreeToggle<CR>

map <leader>gac :Gcommit -am ""<LEFT>
map <leader>gc :Gcommit -m ""<LEFT>
map <leader>gs :Gstatus<CR>
map <leader>gd :! git diff<CR>

map <leader>ra :%s/
map <leader>sc :sp db/schema.rb<cr>

map <leader>vi :vsplit ~/.vimrc<CR><C-l>
nmap <leader>sn :vsplit ~/Google\ Drive/Notes/coding-notes.txt<CR><C-l>

map <leader>x :exec getline(".")<cr>

" show registers
map <leader>" :reg<CR>

" paste from register ("[reg],p)
nnoremap <expr> <leader>p ':put ' . v:register . '<CR>'

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" typos
command! Q q
command! W w
nnoremap ; :
nnoremap <leader><leader> :

" dash twice for underscore
imap -- _

" quit
nmap <leader>q :q!<CR>
nmap <C-c> :q<CR>

" new tab
map <C-t> <esc>:tabnew<CR>

command! Wq wq

nmap <c-s> <esc>:w<CR>
imap <c-s> <esc>:w<CR>

" exit insert mode
imap jj <Esc>

" move up/down long lines
nmap k gk
nmap j gj

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

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

let g:netrw_cursor = 0

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" Command-T
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**,.gitkeep
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,Gemfile.lock
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=0
let g:CommandTMaxFiles=20000
let g:CommandTCancelMap=['<C-q>', '<C-c>']


" -------------------------------------------
filetype plugin indent on

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Format xml files
  autocmd FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

  " Autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,haml,coffee set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  " Dont remember file position for git commits
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

  " Remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  " Spell check when writing commit logs
  autocmd filetype svn,*commit* setlocal spell

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " Watch for file changes
  autocmd FileChangedShell * echo "File changed :e to reload"
augroup END

" ---------------------------------------------------------
" MULTIPURPOSE TAB KEY
" ---------------------------------------------------------
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" ---------------------------------------------------------
" RENAME CURRENT FILE
" ---------------------------------------------------------
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" ---------------------------------------------------------
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme solarized

let g:Powerline_symbols='fancy'
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'

set mouse=a

if has("gui_running")
  set transparency=0
  set lines=90 columns=200
  set mouse=a
endif
