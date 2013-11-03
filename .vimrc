map <F2> :NERDTreeToggle<CR>
call pathogen#infect()
call pathogen#helptags()
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set laststatus=2
filetype plugin on
let mapleader = ","
map <leader>t :CtrlP<CR>
map <leader>r :MRU<CR>
runtime macros/matchit.vim
syntax on
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
let g:lightline = {
        \ 'colorscheme': 'wombat',
      \ }
if !has('gui_running')
  set t_Co=256
endif
