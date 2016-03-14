" Configuration file for vim
" Author:  Kit La Touche <kit@transneptune.net>
" Date:    2016-02-19
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
Plugin 'airblade/vim-gitgutter'         " Show git add/delete/change per line in gutter.
Plugin 'alvan/vim-closetag'             " If I open an HTML tag, I want to close it, alright?
Plugin 'ervandew/supertab'              " Generic tab completion.
Plugin 'flazz/vim-colorschemes'         " Provides the hybrid color scheme I like.
Plugin 'jeetsukumaran/vim-buffergator'  " Better management of buffers.
Plugin 'kien/ctrlp.vim'                 " Best way to open files.
Plugin 'klen/python-mode'               " Excellent Python language support.
Plugin 'davidhalter/jedi-vim'           " Python autocomplete and linters. MUST come after python-mode.
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
                                        " ^^ Better vim status bar.
Plugin 'rizzatti/dash.vim'              " Dash integration (OS X only)
Plugin 'sjl/gundo.vim'                  " More powerful navigation of the undo tree.
Plugin 'tpope/vim-commentary'           " Adds comments as text objects.
Plugin 'tpope/vim-obsession'            " Save and restore vim sessions easily.
Plugin 'tpope/vim-repeat'               " Repeat some more complex actions than basic vim.
Plugin 'tpope/vim-surround'             " Manage surrounding quotes, parens, brackets, and braces.
Plugin 'vim-scripts/argtextobj.vim'     " Adds function arguments as text objects.
" Syntaxes
Plugin 'digitaltoad/vim-jade'           " Syntax highlighting for the Jade templating language.
Plugin 'godlygeek/tabular'              " Automatic formatting of Markdown tables.
Plugin 'plasticboy/vim-markdown'        " Markdown syntax and tools. MUST come after tabular.
Plugin 'groenewege/vim-less'            " Less-css syntax and tools.
Plugin 'jelera/vim-javascript-syntax'   " JavaScript syntax and tools.
Plugin 'kchmck/vim-coffee-script'       " CoffeeScript syntax and tools.
Plugin 'nono/vim-handlebars'            " Handlebars syntax and tools.
Plugin 'rust-lang/rust.vim'             " Rust syntax and tools.
Plugin 'tomlion/vim-solidity'           " Ethereum Solidity syntax and tools.
" Utilities
Plugin 'alfredodeza/pytest.vim'         " Integration with py.test
Plugin 'mileszs/ack.vim'                " Search all files in a codebase efficiently.
Plugin 'tpope/vim-fugitive'             " Git integration tools.
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

""""
" First, some basics:
syntax on
colorscheme hybrid_reverse
set autoindent
set backspace=2
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hlsearch
set laststatus=2
set lazyredraw
set noshowmode
set number
set pastetoggle=<F2>
set shiftwidth=4
set shortmess=aIO
set showtabline=2
set softtabstop=4
set tabstop=4

" Let's see the line we're on
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

""""
" Python configuration
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

""""
" Django templating language
au FileType htmldjango inoremap {% {% %}<left><left><left>
au FileType htmldjango inoremap {{ {{ }}<left><left><left>

""""
" Markdown configuration
let g:vim_markdown_folding_style_pythonic = 1
" Spell check markdown files.
autocmd BufRead,BufNewFile *.md setlocal spell

""""
" Narrower indents
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css  setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

""""
" ack.vim searching
" If we have ag (the Silver Searcher), let's use it.
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

""""
" Pymode

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

" Let's use Jedi instead of Rope, but turn off the documentation window.
let g:pymode_rope = 0
autocmd FileType python setlocal completeopt-=preview

""""
" Ctrl-P (Better file opening)
" With Buffergator, to better handle buffer-switching

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|tox)|tmp|node_modules|bower_components|dist|\_site|*.egg-info|htmlcov)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pyc|swp)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

""""
" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

""""
" Dash docset mappings:
"let g:dash_map = {
"    \ 'rust' : 'rust'
"\ }

"""" Mappings

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Let's get fancy. Change two fundamental mappings
let mapleader=","
nnoremap ; :
vnoremap ; :

" Convert to snake_case:
nmap <silent><leader>sc :s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<cr>

" Better paragraph wrapping.
vmap Q gq
nmap Q gqap

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Show gundo
nnoremap <F5> :GundoToggle<cr>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Clear last-search buffer
nmap <silent><leader>cb :nohlsearch<cr>

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

""""
" Custom functions

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

" Git checkpoint
function! GitCheckpoint()
    " Requires the git-checkpoint command defined in .gitconfig
    silent !git checkpoint
    redraw!
endfunction
map <silent><leader>gc :call GitCheckpoint()<cr>

function! CopyMarkdownAsRichText()
    let markdown = 'kramdown'
    exec ':w !' . markdown .
       \ '| textutil -stdin -inputencoding utf-8 -format html -convert rtf -stdout ' .
       \ '| pbcopy'
endfunction
nmap <silent><leader>mk :call CopyMarkdownAsRichText()<cr>
