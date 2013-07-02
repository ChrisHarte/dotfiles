" We have to have a winheight bigger than we want to set winminheight. But if we
" set winheight to be huge before winminheight, the winminheight set will fail.
"set winwidth=84
"set winheight=10
"set winminheight=10
"set winheight=999


" copy and paste to system clipboard
map <leader>p "*p<CR>:exe ":echo 'pasted from clipboard'"<CR>
map <leader>y "*y<CR>:exe ":echo 'copied to clipboard'"<CR>


map <leader>bb :!bundle install<cr>
nmap <leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>

" goto end of line
imap <C-l> <esc>$a

" set noesckeys " DO NOT ENABLE breaks normal vim's arrow keys in insert mode

" load external files
source ~/.dotfiles/vim-config/plugins.vim
source ~/.dotfiles/vim-config/functions.vim

" Tabular
" map <Leader>cu :Tabularize /\|<CR>

" press ctrl+l for a hash rocket =>
" imap <C-l> <Space>=><Space>

" Navigate splits
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

map <Leader>np :set nopaste<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" CTRL-P
map <leader>ec :CtrlP app/controllers<cr>
map <leader>ea :CtrlP app<cr>
map <leader>em :CtrlP app/models<cr>
map <leader>ev :CtrlP app/views<cr>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|vendor\/bundle$',
  \ 'file': '\.exe$\|\.so$\|\.dat$\|\.gitkeep$\|\Gemfile.lock$\|.DS_Store',
  \ }

map <leader>t :CtrlPMixed<ENTER>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1 " make dotfiles searchable
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 50
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_user_command = 'find %s -type f'

" https://github.com/kien/ctrlp.vim/issues/160 selections open in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }


## Functions

" tab to open tag list dropdown on insert mode
inoremap <Tab> <C-P>

" ---------------------------------------------------------
" strip trailing whitespace
" http://vimcasts.org/episodes/tidying-whitespace
" ---------------------------------------------------------
" function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>


" ---------------------------------------------------------
" stop indenting when pasting to vim in osx
" (bad as causes delay when switching modes)
" ---------------------------------------------------------
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
