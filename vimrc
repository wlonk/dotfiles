" Configuration file for vim
" Author:  Kit La Touche <kit@transneptune.net>
" Date:    2015-05-11
" Comment: Vim on and love through unrepining hours
"          Before us lies eternity; our souls
"          Are vim, and a continual farewell.

" First, we don't care about vi compatability.
set nocompatible

" Need to turn filetype off when starting Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Functionality
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'  " Must come after python-mode
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
" Syntaxes
Plugin 'digitaltoad/vim-jade'
Plugin 'godlygeek/tabular'
Plugin 'wlonk/vim-markdown'  " Must come after tabular
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'raichoo/haskell-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'wting/rust.vim'
" Utilities
Plugin 'alfredodeza/pytest.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
call vundle#end()

" Turn filetype back on now that Vundle is done
filetype plugin indent on

" Brief help for Vundle
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line
" ==============================================================================

" First, some basics:
syntax on
colorscheme hybrid
set autoindent
set backspace=2
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hlsearch
set lazyredraw
set number
set shiftwidth=4
set shortmess=I
set showtabline=2
set softtabstop=4
set tabstop=4

" Let's see the line we're on
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Python configuration
" What follows is a horrible kludge to deal with the fact that work has 120
" character lines, personal projects have 80. So we key off the hostname,
" which is a reasonable approximation.
let hostname = substitute(system('hostname'), '\n', '', '')

if hostname == 'gorlois'
    augroup vimrc_autocmds
        autocmd!
        autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python match Excess /\%120v.*/
        autocmd FileType python set nowrap
    augroup END
else
    augroup vimrc_autocmds
        autocmd!
        autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python match Excess /\%80v.*/
        autocmd FileType python set nowrap
    augroup END
endif

" Narrower yaml indents
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"""" ack.vim searching
" If we have ag (the Silver Searcher), let's use it.
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"""" Pymode

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" What follows is a horrible kludge to deal with the fact that work has 120
" character lines, personal projects have 80. So we key off the hostname,
" which is a reasonable approximation.
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == 'gorlois'
    let g:pymode_options_max_line_length = 120
endif

" Let's use Jedi instead of Rope, but turn off the documentation window.
let g:pymode_rope = 0
autocmd FileType python setlocal completeopt-=preview

"""" Ctrl-P (Better file opening)
" With Buffergator, to better handle buffer-switching

"""" NERDTree filtering
let NERDTreeIgnore = [
  \ '\~$',
  \ '\.pyc$',
  \ '\.git$',
  \ '\.hg$',
  \ '\.svn$',
  \ '\.tox$',
  \ 'tmp$',
  \ 'node_modules$',
  \ 'bower_components$',
  \ 'dist$',
  \ '_site$',
  \ '*.egg-info$'
\]

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|tox)|tmp|node_modules|bower_components|dist|\_site|*.egg-info)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pyc|swp)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

"""" Mappings

" Show nerdtree
map <silent><F2> :NERDTreeToggle<cr>

" Show gundo
nnoremap <F5> :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Clear last-search buffer
nmap <silent><leader>cb :let @/ = ""<cr>

" Go to the previous buffer open
nmap <silent><leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <silent><leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <silent><leader>bl :BuffergatorOpen<cr>

" New tab, close tab kind of behavior.
nmap <silent><leader>T :enew<cr>
nmap <silent><leader>bq :bp <BAR> bd #<cr>

" Quick switch last two buffers
nmap <silent><leader><leader> <C-^>

" Quick open todo
nmap <silent><leader>tt :sp note:todo<cr>

" Run tests
" (May want to generalize or improve this eventually?)
nmap <silent><leader>t <Esc>:Pytest file<cr>

" Set filetype
nmap <leader>ft <Esc>:set ft=

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
    endif
endfunction
map <leader>n :call RenameFile()<cr>
