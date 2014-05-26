call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set laststatus=2
filetype plugin on
let mapleader = ","
map <leader>t :CtrlP<CR>
map <leader>r :MRU<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader><leader> <C-^>
runtime macros/matchit.vim
set complete=.,w,b,u,t
set nobackup
set nowritebackup
set noswapfile
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set splitbelow
set splitright
set number
nnoremap <C-S> <C-W><C-S>
nnoremap <C-Q> <C-W><C-Q>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set laststatus=2
set guifont=Monaco\ for\ Powerline:h12
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
if !has('gui_running')
  set t_Co=256
endif
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'

" vim-rspec mappings
map <Leader>s :call RunCurrentSpecFile()<CR>
map <Leader>c :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"
" Automatic folding
set foldmethod=syntax
set nofoldenable

" Fold by pressing space
nnoremap <SPACE> za
nnoremap <leader><SPACE> zA

" Highlight search
:set hlsearch

" Highlight trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Highlighting
au BufRead,BufNewFile Gruntfile setfiletype javascript

