map <F2> :NERDTreeToggle<CR>
call pathogen#infect()
call pathogen#helptags()
set tabstop=2
set shiftwidth=2
set autoindent
:colorscheme railscasts
set laststatus=2
let g:Powerline_symbols = 'fancy'
filetype plugin on
let mapleader = ","
map <leader>t :CommandT<CR>
