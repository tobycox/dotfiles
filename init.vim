set nocompatible              " be iMproved, required filetype off                  " required

let g:python3_host_prog = '/usr/local/bin/python3'

" Vim plug
call plug#begin()

" Packages
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/mru.vim'
Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jgdavey/tslime.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'
Plug 'altercation/vim-colors-solarized'
Plug 'mxw/vim-jsx'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-abolish'
Plug 'troydm/zoomwintab.vim'
Plug 'kassio/neoterm'
Plug 'Shougo/deoplete.nvim'
Plug 'wokalski/autocomplete-flow'
Plug 'roman/golden-ratio'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'sbdchd/neoformat'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomlion/vim-solidity'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

call plug#end()

" Colour theme (default neovim, inherit iTerm2 scheme)
" set encoding=utf-8
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

set hidden
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
filetype plugin on
let mapleader = "\<Space>"
map <leader>p :CtrlP<CR>
map <leader>r :CtrlPMRUFiles<CR>

nnoremap <leader>f :Grepper<cr>
let g:grepper = { 'next_tool': '<leader>g' }

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
nnoremap <C-S> :w<CR>
nnoremap <C-Q> <C-W><C-Q>
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'tagbar' ] ],
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'tagbar': '%{gutentags#statusline("[Generating\ tags...]")}'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set statusline+=%{gutentags#statusline()}


if !has('gui_running')
  set t_Co=256
endif

" Highlight search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

" Highlighting
au BufRead,BufNewFile Gruntfile setfiletype javascript
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gh :Gbrowse<cr>
nmap <leader>gb :Gblame<cr>

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Window navigation in terminal mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-w>s <C-\><C-n><C-w>s
tnoremap <C-w>v <C-\><C-n><C-w>v

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Convert window to terminal
nnoremap <C-w>t :terminal<CR>
nnoremap <A-t> :terminal<CR>

" Create a bottom window with a terminal
map <Leader>t :Ttoggle<CR>

" Create new tab with four vertical splits
map <A-2> :tabnew<CR>:term<CR><esc>:vsplit term://zsh<CR><esc>

" Zoom the current window
nnoremap <silent> <C-w>w :ZoomWinTabToggle<CR>
tnoremap <silent> <C-w>w <C-\><C-n>:ZoomWinTabToggle<CR>

" Tab Navigation
tnoremap <C-w>n <C-\><C-n>:tabnext<CR>
tnoremap <C-w>p <C-\><C-n>:tabprev<CR>
tnoremap <C-w>c <C-\><C-n>:tabnew<CR>
nnoremap <C-w>n :tabnext<CR>
nnoremap <C-w>p :tabprev<CR>
nnoremap <C-w>c :tabnew<CR>

" Nerdcomment
let g:NERDSpaceDelims=1

" Neomake
let g:neomake_scss_csslint_maker = {
  \ 'args': ['--format=compact'],
  \ 'errorformat':
      \ '%-G,' .
      \ '%-G%f: lint free!,' .
      \ '%f: line %l\, col %c\, %trror - %m,' .
      \ '%f: line %l\, col %c\, %tarning - %m,'.
      \ '%f: line %l\, col %c\, %m,'
\ }
let g:neomake_elixir_enabled_makers = ['elixir']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_scss_enabled_makers = ['csslint']
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')

autocmd! BufWritePost * Neomake

" Neoformat
autocmd! BufWritePre *.js Neoformat prettier
autocmd! BufWritePre *.jsx Neoformat prettier

" Ctrl-P
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|cache)|(\.(swp|ico|git|svn|png|jpg))$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']


" Macros
let @c='"_dwP'

" React
let g:jsx_ext_required = 0

" vim-test
let test#strategy = "neoterm"
map <Leader>s :TestFile<CR>
map <Leader>c :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>
map <Leader>v :TestVisit<CR>

" Use system clipboard
set clipboard=unnamed

" Vertical diff
set diffopt+=vertical

" Alt-keys in :terminal https://github.com/neovim/neovim/issues/2440
tnoremap <A-b> <Esc>b
tnoremap <A-f> <Esc>f
tnoremap <A-.> <Esc>.

" Auto insert when switching to terminal tab
autocmd WinEnter term://* startinsert

" Window resizing
noremap <silent> <S-Left> <C-W><<C-W><
noremap <silent> <S-Right> <C-W>><C-W>>
noremap <silent> <S-Up> <C-W>+
noremap <silent> <S-Down> <C-W>-
tnoremap <silent> <S-Left> <C-\><C-n><C-W><<C-W><
tnoremap <silent> <S-Right> <C-\><C-n><C-W>><C-W>>
tnoremap <silent> <S-Up> <C-\><C-n><C-W>+
tnoremap <silent> <S-Down> <C-\><C-n><C-W>-

" Neoterm
let g:neoterm_size = "20"

" Exit insert mode in terminal
tnoremap <C-[> <C-\><C-n>

" Deoplete
set runtimepath+=~/.vim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1

" Neosnippet
let g:neosnippet#enable_completed_snippet = 1

" No visual mode
nnoremap Q <NOP>

" True color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show tabline
set showtabline=1

" Toggle background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Remap word navigation to CamelCaseMotion equivalents
map <Leader>w <Plug>CamelCaseMotion_w
map <Leader>b <Plug>CamelCaseMotion_b
map <Leader>e <Plug>CamelCaseMotion_e


" https://github.com/tpope/vim-rails/issues/368
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }
