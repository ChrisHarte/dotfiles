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

" Command-T
let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1
set autochdir