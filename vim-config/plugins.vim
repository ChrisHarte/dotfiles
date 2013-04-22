" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
 
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Silver Searcher
map <leader>a :Ag<space>

" BufferGator
map <leader>b :BuffergatorToggle<cr> " toggle view
let g:buffergator_suppress_keymaps = 1 " suppress BufferGator default mapping

" CTRL-P
map <leader>t :CtrlPMixed<ENTER>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1 " make dotfiles searchable
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 50
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=*/vendor/bundle/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.dat$\|\.gitkeep$\|\Gemfile.lock$\|\.DS_Store',
  \ }

" https://github.com/kien/ctrlp.vim/issues/160 selections open in new tab
" let g:ctrlp_prompt_mappings = {
"  \ 'AcceptSelection("e")': ['<c-t>'],
"  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"  \ }

