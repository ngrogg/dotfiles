" My .vimrc

" " Vim basics
" This must be first, because it changes other options as a side effect.
set nocompatible

" Required for vimwiki
filetype plugin on

" force 256 colors
set t_Co=256

" Use UTF-8 encoding
set encoding=utf-8

" Enable vim to use the system clipboard
set clipboard=unnamedplus

" Turn syntax on by default
syntax on

" Disable .wiki syntax highlighting
" " Tell vim which filetypes are wiki file types
autocmd BufRead,BufNewFile *.wiki set filetype=wiki

" " Set syntax off for wiki files
autocmd FileType wiki syntax off

" Visual autocomplete for command menu
set wildmenu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Always set autoindenting on
set autoindent

" Keep a backup file (restore to previous version)
set backup

" Keep an undo file (undo changes after closing)
set undofile

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Sets a tab to be four spaces
set tabstop=4

" Converts tabs to spaces, useful if file moves to other systems
set expandtab

" " Visual changes
" Show line numbers
set number
set relativenumber

" Set vim colorscheme
colorscheme habamax

" configure CursorLines
set cursorline
hi CursorLine cterm=NONE ctermbg=232 ctermfg=15
hi CursorLineNr cterm=bold ctermbg=10 ctermfg=232

" " Vim Statusline
" Enable statusline
set laststatus=2
set statusline=

" Show current mode
" Define mode options
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

" Define color
highlight Status1 ctermbg=10 ctermfg=232
highlight Status2 ctermbg=232 ctermfg=15

" Append to status line
set statusline+=\ %{toupper(g:currentmode[mode()])}%#Status1#

" Show full file path
set statusline+=File\ Path:%F

" Show if current file has been modified
set statusline+=%{&modified?'[+]':''}

" Set following options to right of window
set statusline+=%=

" Whitespace
set statusline+=%#Status2#
set statusline+=\\|

" Show current line number
set statusline+=Line\ Number:%l

" Whitespace
set statusline+=\\|

" Show total number of lines in file
set statusline+=Total:%L

" Whitespace
set statusline+=\\|

" Show percentage through file
set statusline+=%p%%\|

" " Vim Plugin configurations
" Vim preview stuff
let g:livepreview_previewer = 'evince'

" YCM disable error checking
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" " Tagbar
" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Set Tagbar width to 15%
let g:tagbar_width = max([15, winwidth(0) / 5])

" Autoclose Nerdtree if Tagbar and Nerdtree are the only windows open
let g:tagbar_autoclose_netrw = 1

" Tagbar set autofocus on open
let g:tagbar_autofocus = 1

" Set Tagbar to be case insensitive
let g:tagbar_case_insensitive = 1

" Show line numbers for tags in tag window, 1 = absolute line numbers
let g:tagbar_show_tag_linenumbers = 1

" " Nerdtree
" Set default window size, based on percentage
let g:NERDTreeWinSize= winwidth(0) * 15/100

" Toggle NERDTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Refresh NERDTree
nnoremap <silent> <F5> :NERDTreeRefreshRoot<CR>

" Close vim if NERDTree if is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Ale stuff
" ALE disable auto-complete
let g:ale_completion_enabled = 0

" ALE go to next error with control + n
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" ALE don't lint when opening file
let g:ale_lint_on_enter = 0

" ALE lint on save
let g:ale_lint_on_save = 1

" ALE fix on save
let g:ale_fix_on_save = 1

" ALE Linter settings
" pylint needs to be installed
let g:ale_linters = {
        \'bash': ['spellcheck','shell'],
        \'c':['gcc'],
        \'cpp':['g++'],
	    \'perl': ['perl','perlcritic'],
	    \'powershell':['powershell'],
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
    autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
    autocmd BufNewFile *.ps1 0r ~/.vim/templates/skeleton.ps1
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

" " Vimsplit stuff
" Remap vimsplit navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Split settings for a more natural split
set splitbelow
set splitright

" " Keybindings
" Remap jj to escape
imap jj <esc>

" Auto close test for (, [, { in insert mode
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" " vim-plug stuff
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Install YouCompleteMe autocomplete
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" Latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" ALE Linter
Plug 'dense-analysis/ale'

" powershell.vim
Plug 'pprovost/vim-ps1'

" Multi-cursor plugin
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Tagbar plugin
Plug 'preservim/tagbar'

" Vim Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim NerdTree
Plug 'preservim/nerdtree'

" Vim wiki plugin
Plug 'vimwiki/vimwiki'

call plug#end()
