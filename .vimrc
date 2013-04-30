map <F2> :NERDTreeToggle<CR>
call pathogen#infect()
call pathogen#helptags()
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
:colorscheme railscasts
set laststatus=2
let g:Powerline_symbols = 'fancy'
filetype plugin on
let mapleader = ","
map <leader>t :CommandT<CR>
map <leader>r :MRU<CR>
runtime macros/matchit.vim
set syntax=on
set complete=.,w,b,u,t
set nobackup
set nowritebackup
set noswapfile
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set splitbelow
set splitright
nnoremap <C-S> <C-W><C-S>
nnoremap <C-Q> <C-W><C-Q>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
