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
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/nerdtree'
Plugin 'mustache/vim-mustache-handlebars'
Bundle 'camelcasemotion'

call vundle#end()

" Colour theme (default neovim, inherit iTerm2 scheme)
set background=dark

set clipboard=unnamed
set hidden
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
map <C-d> :NERDTreeToggle<CR>

" Neomake
let g:neomake_elixielixir_enabled_makers = ['elixir']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake

" Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

" Macros
let @c='"_dwP'
let @d='oimport code; code.interact(local=locals())'
