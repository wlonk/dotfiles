" Configuration file for vim
" Author:  Kit La Touche <kit@transneptune.net>
" Date:    2018-04-07
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
Plugin 'ctrlpvim/ctrlp.vim'             " Best way to open files.
Plugin 'ervandew/supertab'              " Generic tab completion.
Plugin 'flazz/vim-colorschemes'         " Provides the hybrid color scheme I like.
Plugin 'jeetsukumaran/vim-buffergator'  " Better management of buffers.
Plugin 'python-mode/python-mode'        " Excellent Python language support.
Plugin 'Valloric/YouCompleteMe'         " Powerful autocomplete tools
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
                                        " ^^ Better vim status bar.
Plugin 'jebaum/vim-tmuxify'             " Control Tmux panes from Vim.
" Plugin 'majutsushi/tagbar'              " Show file logical structure.
Plugin 'MattesGroeger/vim-bookmarks'    " Improve line marks.
" Plugin 'michaeljsmith/vim-indent-object'
                                        " ^^ Add indent objects.
Plugin 'sjl/gundo.vim'                  " More powerful navigation of the undo tree.
Plugin 'tpope/vim-dispatch'             " Better :make commands
Plugin 'tpope/vim-commentary'           " Adds comments as text objects.
Plugin 'tpope/vim-obsession'            " Save and restore vim sessions easily.
Plugin 'tpope/vim-repeat'               " Repeat some more complex actions than basic vim.
Plugin 'tpope/vim-surround'             " Manage surrounding quotes, parens, brackets, and braces.
Plugin 'tpope/tpope-vim-abolish'        " Better smarter replacing.
Plugin 'wlonk/argtextobj.vim'           " Adds function arguments as text objects. (Using my own fork.)
" Plugin 'wlonk/vim-orthodontics'         " Reshape inside braces. (experimental plugin.)

" Syntaxes
Plugin 'Glench/Vim-Jinja2-Syntax'       " Jinja2 and Nunjucks syntax.
Plugin 'Rykka/riv.vim'                  " reStructuredText tools.
Plugin 'lervag/vimtex'                  " LaTeX
" Plugin 'cespare/vim-toml'               " Syntax for TOML, to facilitate Rust packaging.
" Plugin 'godlygeek/tabular'              " Automatic formatting of Markdown tables.
" Plugin 'plasticboy/vim-markdown'        " Markdown syntax and tools. MUST come after tabular.
" Plugin 'mxw/vim-jsx'                    " React and JSX.
Plugin 'pangloss/vim-javascript'        " JavaScript syntax and tools.
" Plugin 'rust-lang/rust.vim'             " Rust syntax and tools.

" Utilities
Plugin 'alfredodeza/pytest.vim'         " Integration with py.test
Plugin 'mileszs/ack.vim'                " Search all files in a codebase efficiently.

" Plugins for syntaxes I don't currently work with:
" Plugin 'digitaltoad/vim-pug'            " Syntax highlighting for the Pug templating language.
" Plugin 'mustache/vim-mustache-handlebars'
"                                         " ^^ Handlebars syntax and tools.
" Plugin 'wlonk/choicescript.vim'         " Choicescript syntax and tools.

" Plugins I never folded into my workflow:
" Plugin 'tpope/vim-fugitive'             " Git integration tools.
" Plugin 'alvan/vim-closetag'             " If I open an HTML tag, I want to close it, alright?
" Plugin 'christoomey/vim-sort-motion'    " Sort text objects.
" Plugin 'jmcomets/vim-pony'              " Utilities for working with Django projects.
" Plugin 'rizzatti/dash.vim'              " Dash integration (OS X only).
" Plugin 'mattn/emmet-vim'                " More better HTML writing
" Plugin 'racer-rust/vim-racer'           " Auto completion for Rust.
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
syntax on                               " Enable synax highlighting.
colorscheme hybrid_reverse              " A color scheme I like.
set autoindent                          " Smart indent on newline.
set backspace=2                         " More powerful backspace (works on space-tabs).
set clipboard=unnamed                   " Default to system clipboard.
set encoding=utf-8                      " A more elegant encoding for a more civilized age.
set expandtab                           " Turn tabs into spaces.
set fileencoding=utf-8                  " A more elegant encoding for a more civilized age.
set foldlevelstart=20                   " Start with things unfolded by default.
set hidden                              " Allow hiding buffers without saving all changes.
set hlsearch                            " Highlight search matches.
set laststatus=2                        " Make the status bar show a bit less.
set lazyredraw                          " Only redraw when you have to (helps with flickering).
set noshowmode                          " Don't need to show mode, we have POWERLINE.
set noswapfile                          " Don't write those pesky .*.swp files.
set number                              " Show linenumbers in leftmost column.
set pastetoggle=<F2>                    " Use F2 to toggle paste mode.
set shiftwidth=4                        " By default, make tabs 4 spaces.
set shortmess=aIO                       " Configure status-line messages:
                                        "  - a: use shorter versions of all basic messages, to
                                        "       conserve screen real estate.
                                        "  - I: Don't show the "this is vim" intro message on
                                        "       startup.
                                        "  - O: Overwrite previous messages when reading a file.
set showtabline=2                       " Show all open tabs at the top, always.
set softtabstop=4                       " Again, tabs are 4 spaces.
set splitbelow                          " Open splits below current window.
set splitright                          " Open vsplits to right of current window.
set switchbuf="usetab"                  " When jumping to a buffer, use the existing buffer and
                                        " tab, if available.
set tabstop=4                           " Tabs. Are. Four. Spaces.
set ttyfast                             " Convince vim it has a fast connection to the TTY.

" Let's see the line we're on
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

"""
augroup vimrcEx
    " Clear all autocmds in the group
    autocmd!
    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    autocmd BufReadPost COMMIT_EDITMSG
                \ exe "normal! gg0"
    autocmd BufReadPost PULLREQ_EDITMSG
                \ exe "normal! gg0"
    autocmd BufReadPost GHI_ISSUE
                \ exe "normal! gg0"
augroup END


"""
" Tagbar configuration

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsargs' : '-f - --sort=no',
    \ 'kinds' : [
        \ 'c:chapter',
        \ 's:sections',
        \ 'S:subsections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 'c' : 'chapter',
        \ 's' : 'section',
        \ 'S' : 'subsection',
    \ },
    \ 'sort': 0,
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \ 'T:types,type definitions',
        \ 'f:functions,function definitions',
        \ 'g:enum,enumeration names',
        \ 's:structure names',
        \ 'm:modules,module names',
        \ 'c:consts,static constants',
        \ 't:traits',
        \ 'i:impls,trait implementations',
    \ ]
\ }

""""
" Quickfix controls
augroup vimrcQuickfix
    autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>
augroup END

""""
" Python configuration
augroup vimrcPython
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    autocmd FileType python nnoremap <leader>= :0,$!yapf<cr>
    autocmd FileType python nnoremap <leader>i :!isort -ns %:t %<cr><cr>
    " .pyi is a Python interface file.
    autocmd BufNewFile,BufRead *.pyi set filetype=python
augroup END

""""
" Sphinx & reStructuredText configuration
augroup vimrcSphinx
    autocmd!
    autocmd BufEnter *.rst silent! lcd %:p:h
    autocmd FileType rst nnoremap <cr> :Dispatch make dirhtml<cr>
    autocmd FileType rst setlocal textwidth=72
augroup END

""""
" Jinja and Nunjucks config
autocmd BufNewFile,BufRead *.njk set filetype=jinja

""""
" Django templating language
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd FileType htmldjango inoremap {% {% %}<left><left><left>
autocmd FileType htmldjango inoremap {{ {{ }}<left><left><left>
augroup vimrcDjango
    autocmd!
    autocmd FileType htmldjango let b:surround_{char2nr("v")} = "{{ \r }}"
    autocmd FileType htmldjango let b:surround_{char2nr("{")} = "{{ \r }}"
    autocmd FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
    autocmd FileType htmldjango let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
    autocmd FileType htmldjango let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
    autocmd FileType htmldjango let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
    autocmd FileType htmldjango let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
    autocmd FileType htmldjango let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
augroup END

""""
" Markdown configuration
let g:vim_markdown_folding_style_pythonic = 1

" Spell check markdown files.
autocmd FileType markdown setlocal spell
autocmd FileType rst setlocal spell

""""
" Handlebars abbreviations
" {{# etc.
let g:mustache_abbreviations = 1

""""
" Narrower indents
" (These don't have to be in an augroup, as repeating them has no effect.)
autocmd FileType css             setlocal shiftwidth=2 tabstop=2
autocmd FileType eruby           setlocal shiftwidth=2 tabstop=2
autocmd FileType handlebars.html setlocal shiftwidth=2 tabstop=2
autocmd FileType html            setlocal shiftwidth=2 tabstop=2
autocmd FileType html.handlebars setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango      setlocal shiftwidth=2 tabstop=2
autocmd FileType jade            setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript      setlocal shiftwidth=2 tabstop=2
autocmd FileType less            setlocal shiftwidth=2 tabstop=2
autocmd FileType pug             setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby            setlocal shiftwidth=2 tabstop=2
autocmd FileType sass            setlocal shiftwidth=2 tabstop=2
autocmd FileType scss            setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml            setlocal shiftwidth=2 tabstop=2

autocmd FileType rst             setlocal shiftwidth=3 tabstop=3

""" Basics:

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Let's get fancy. Change two fundamental mappings
let mapleader=","
nnoremap ; :
vnoremap ; :

cnoremap <expr> %% expand('%:h').'/'

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
let g:pymode_lint_checkers = ['pycodestyle']
let g:pymode_lint_ignore = ["W503"]

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_python = 'python3'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't use pymode's folding, it's slow af:
let g:pymode_folding = 0

" Let's use Jedi instead of Rope, but turn off the documentation window.
let g:pymode_rope = 0
autocmd FileType python setlocal completeopt-=preview
let g:ycm_python_binary_path = 'python'

" Turn off ycm diagnostics, so we can use leader-d for 'definition':
let g:ycm_key_detailed_diagnostics = ''
nmap <leader>d :YcmCompleter GoTo<cr>

" Custom Python helpers:
" Insert argskwargs with <c-l>
imap <c-l> *args,<space>**kwargs
imap <c-l><c-t> *args:<space>VarArg,<space>**kwargs:<space>KwArg

""""
" Ctrl-P (Better file opening)
" With Buffergator, to better handle buffer-switching

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|tox)|tmp|node_modules|bower_components|dist|\_site|*.egg-info|htmlcov|jscov|_?build)$',
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
" Rust settings
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let $RUST_SRC_PATH = $HOME . "/code/rust"
augroup vimrcRust
    autocmd FileType rust :compiler cargo
    autocmd FileType rust nnoremap <cr> :Make test<cr>
augroup END

"""" Mappings
" Convert to snake_case:
nmap <silent><leader>sc :s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<cr>

" Select last pasted lines
nnoremap gp `[v`]

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
nnoremap <space> :nohlsearch<cr>

" Go to the previous buffer open
nmap <silent><leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <silent><leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <silent><leader>bl :BuffergatorOpen<cr>

" New tab, close tab kind of behavior.
nmap <silent><leader>T :enew<cr>
nmap <silent><leader>bq :bp <bar> bd #<cr>

" Quick switch last two buffers
nmap <silent><leader><leader> <C-^>

" Run tests
" (May want to generalize or improve this eventually?)
nmap <silent><leader>t <Esc>:Pytest file<cr>

" Set filetype
nmap <leader>ft <Esc>:set ft=

" Open sibling file
nmap <leader>os <Esc>:e %:h/

" Custom vim-tmuxify actions for particular filetypes:
if !exists('g:tmuxify_run')
    let g:tmuxify_run = {}
endif
let g:tmuxify_run['rust'] = "cargo test"

function! GetTxWindow()
    let win = system('tmux display-message -p ' . shellescape("'#I'")) 
    let win = substitute(win, '\n$', '', '')
    let win = substitute(win, "'", '', 'g')
    return win
endfunction

function! SetGlobalTxPane()
    let pane = "0:" . GetTxWindow() . ".2"
    execute ':TxSetPane! ' . pane
endfunction

function! SetTestCmd(cmd)
    call SetGlobalTxPane()
    echo a:cmd
    execute ":nmap <leader><cr> :TxSend! " . a:cmd . "<cr>"
endfunction
command! -nargs=1 SetTestCmd call SetTestCmd(<f-args>)


""""
" Custom functions

" Don't get me wrong, I love smart quotes, but not in source.
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

" Create missing directories on write. Really shines in combo with the
" auto-test-files function below.
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup vimrcCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

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

" OS X only: copy a markdown buffer to the system clipboard as richtext.
function! CopyMarkdownAsRichText()
    let markdown = 'kramdown'
    exec ':w !' . markdown .
       \ '| textutil -stdin -inputencoding utf-8 -format html -convert rtf -stdout ' .
       \ '| pbcopy'
endfunction
nmap <silent><leader>mkc :call CopyMarkdownAsRichText()<cr>

" Increment a column of numbers, one after the other.
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-i> :call Incr()<CR>

" If we're in a Python file 'foo.py', open 'tests/foo.py'
function RelatedTests()
    let current_file = expand("%")
    let path_components = split(current_file, '/')
    let is_python = match(current_file, '.py$') != -1
    let in_tests = match(current_file[-2], '^tests$') != -1

    if !is_python || in_tests
        return 'no tests'
    end

    let tests_path = path_components[:-2] + ['tests'] + path_components[-1:]
    return join(tests_path, '/')
endfunction
function OpenRelatedTests()
    let related_tests = RelatedTests()
    if related_tests != ''
        exec ':e ' . related_tests
    end
endfunction
nnoremap <leader>. :call OpenRelatedTests()<cr>

function Blacken()
    exec '%! black -q -'
endfunction
command! Blacken call Blacken()
