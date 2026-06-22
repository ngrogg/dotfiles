" My .vimrc
" Goes in ~/.vimrc
" Revision: 20260622

" Vim basics
" " Disables vi mode and allows newer configuration options. Must be first.
set nocompatible

" vim-plug stuff
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" " Install YouCompleteMe autocomplete
Plug 'Valloric/YouCompleteMe'

" " ALE Linter
Plug 'dense-analysis/ale'

" " Vim Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" " Vim Latex Live Preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" " Vim NerdTree
Plug 'preservim/nerdtree'

" " Vim wiki plugin
Plug 'vimwiki/vimwiki'

call plug#end()

" Vim global configs
" " Enable loading plugin files for specific file types
" " Required for vimwiki
filetype plugin indent on

" " force 256 colors
set t_Co=256

" " Use UTF-8 encoding
set encoding=utf-8

" " Enable vim to use the system clipboard
set clipboard=unnamedplus

" " Turn syntax on by default
syntax on

" " Visual autocomplete for command menu
set wildmenu

" " Show matching brackets when typed
set showmatch

" " Moves for 5 tenths of a second
set matchtime=5

" " allow backspacing over everything in insert mode
set backspace=indent,eol,start

" " Always set autoindenting on
set autoindent

" " Keep a backup file (restore to previous version)
set backup

" " Set where to save backup file, dir needs to exist
set backupdir=~/.vim/backupdir

" " Set backup extension to use timestamps instead of default "~"
" " " Create backup before overwriting the current buffer
set writebackup

" " " Dynamic timestamp extension
au BufWritePre * let &backupext = '@' . strftime('%F.%H:%M')

" " Keep an undo file (undo changes after closing)
set undofile

" " Keep 200 lines of command line history
set history=200

" " Show the cursor position all the time
set ruler

" " Display incomplete commands
set showcmd

" " Highlight search commands, use :noh to clear
set hlsearch

" " Do incremental searching
set incsearch

" " Case insensitive search
set ignorecase

" " Use case sensitive search if capital letters are used
set smartcase

" " Sets a tab to be four spaces
set tabstop=4

" " Set follow up tabs/deletions to 4 spaces as well
set softtabstop=4

" " Set shiftwidth to set how many spaces make up an indentation level
set shiftwidth=4

" " Converts tabs to spaces, useful if file moves to other systems
set expandtab

" Visual changes
" " Show line numbers
set number
set relativenumber

" " Set vim colorscheme
colorscheme habamax

" " configure CursorLines
set cursorline
hi CursorLine cterm=NONE ctermbg=232 ctermfg=15
hi CursorLineNr cterm=bold ctermbg=10 ctermfg=232

" " Set cursorcolumn for indents
set cursorcolumn

" Vim Statusline
" " Enable statusline
set laststatus=2
set statusline=

" " Show current mode
" " Define mode options
let g:currentmode={
    \ 'c'  : 'Command ',
    \ 'i'  : 'INSERT ',
    \ 'n'  : 'NORMAL ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 't'  : 'Term ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·Line ',
    \ "\<C-V>" : 'V·Block ',
    \}

" " Define color
highlight Status1 ctermbg=10 ctermfg=232
highlight Status2 ctermbg=232 ctermfg=15

" " Append to status line with a fallback for undefined modes
set statusline+=\ %{toupper(get(g:currentmode,mode(),mode()))}%#Status1#

" " Show full file path
set statusline+=File\ Path:%F

" " Show if current file has been modified
set statusline+=%{&modified?'[+]':''}

" " Set following options to right of window
set statusline+=%=

" " Whitespace
set statusline+=%#Status2#
set statusline+=\\|

" " Show current line number
set statusline+=Line\ Number:%l

" " Whitespace
set statusline+=\\|

" " Show total number of lines in file
set statusline+=Total:%L

" " Whitespace
set statusline+=\\|

" " Show percentage through file
set statusline+=%p%%\|

" " Clear colors
set statusline+=%*

" Vim Plugin configurations
" " Vim preview stuff
"let g:livepreview_previewer = 'evince'
"let g:livepreview_previewer = 'okular'

" " YCM disable error checking
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" " YCM define global config file
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" Nerdtree
" " Show lines of files
let g:NERDTreeFileLines = 1

" " Toggle NERDTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" " Refresh NERDTree
nnoremap <silent> <F5> :NERDTreeRefreshRoot<CR>

" " Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Ale stuff
" " ALE disable auto-complete
let g:ale_completion_enabled = 0

" " ALE go to next error with control + n
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" " ALE don't lint when opening file
let g:ale_lint_on_enter = 0

" " ALE lint on save
let g:ale_lint_on_save = 1

" " ALE fix on save
let g:ale_fix_on_save = 1

" " ALE Linter settings
" " pylint needs to be installed
let g:ale_linters = {
    \'bash': ['spellcheck','shell'],
    \'c':['gcc'],
    \'cpp':['g++'],
    \'lua':['luac','luacheck'],
    \'perl': ['perl','perlcritic'],
    \'python':['pylint']
    \}

let g:ale_fixers = {
    \'*': ['trim_whitespace', 'remove_trailing_lines'],
    \'c': ['clangtidy','clang-format'],
    \'cpp': ['clangtidy','clang-format']
    \}

" " Vim Template stuff
if has("autocmd")
    augroup templates
        autocmd!
        autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
        autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
        autocmd BufNewFile *.lua 0r ~/.vim/templates/skeleton.lua
        autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
        autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
        autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    augroup END
endif

" Vimsplit stuff
" " Remap vimsplit navigation, limit to normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" " Split settings for a more natural split
set splitbelow
set splitright

" Keybindings
" " Remap jj to escape, use inoremap in case another plugin uses j or escape
inoremap jj <esc>

" " Auto close test for [, { in insert mode
inoremap [ []<Left>
inoremap { {}<Left>
