set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Packages
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/mru.vim'
Plugin 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benekastah/neomake'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/nerdtree'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mxw/vim-jsx'
Plugin 'wookiehangover/jshint.vim'
Plugin 'janko-m/vim-test'
Plugin 'benmills/vimux'
Bundle 'camelcasemotion'

call vundle#end()

" Colour theme (default neovim, inherit iTerm2 scheme)
set encoding=utf-8
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

set clipboard+=unnamedplus
set hidden
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
filetype plugin on
let mapleader = ","
map <leader>t :CtrlP<CR>
map <leader>r :MRU<CR>
map <leader>f :Ag 
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
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
if !has('gui_running')
  set t_Co=256
endif

" Highlight search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

" Highlight trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

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

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Tab Navigation
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tc :tabnew<CR>

" Nerdcomment
let g:NERDSpaceDelims=1

" NERDTree
map <C-i> :NERDTreeToggle<CR>

" Neomake
let g:neomake_elixielixir_enabled_makers = ['elixir']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
autocmd! BufWritePost * Neomake

" Ctrl-P
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor)|(\.(swp|ico|git|svn))$'

" Macros
let @c='"_dwP'
let @d='oimport code; code.interact(local=locals())'

" ctags
:set tags=~/.myctags
function! RefreshTags()
  let cwd = getcwd()
  let cmd ='ctags -R -o ~/.myctags ' . cwd
  let response = system(cmd)
endfunction
map <F5> :call RefreshTags()<CR>

" React
let g:jsx_ext_required = 0

" vim-test
let test#strategy = "vimux"
map <Leader>s :TestFile<CR>
map <Leader>c :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>
map <Leader>v :TestVisit<CR>
