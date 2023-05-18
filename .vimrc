" My .vimrc

" " Vim basics
" This must be first, because it changes other options as a side effect.
set nocompatible

" force 256 colors
set t_Co=256

" Use UTF-8 encoding
set encoding=utf-8

" Enable vim to use the system clipboard
set clipboard=unnamedplus

" Turn syntax on by default
syntax on

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
colorscheme desert

" configure CursorLines
set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=white
hi CursorLineNr cterm=bold ctermbg=blue ctermfg=black

" " Vim Plugin configurations
" Vim preview stuff
let g:livepreview_previewer = 'evince'

" For Lightline
set laststatus=2
set noshowmode

" Set lightline theme
let g:lightline = {
			\'colorscheme':'wombat',
			\}

" YCM disable error checking
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

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
" rustfmt needs to be installed
let g:ale_linters = {'python':['pylint'],
        \'cpp':['g++'],
        \'c':['gcc'],
	\'powershell':['powershell'],
        \'java': ['javac'],
	\'bash': ['spellcheck'],
	\'perl': ['perl','perlcritic']}
let g:ale_fixers = { '*': ['trim_whitespace', 'remove_trailing_lines'],
        \'cpp': ['clangtidy','clang-format'],
        \'rust': ['rustfmt']}

" " Rust vim stuff
" Run rustfmt automatically when saving to buffer
let g:rustfmt_autosave = 1

" " Vim Template stuff
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.ps1 0r ~/.vim/templates/skeleton.ps1
    autocmd BufNewFile *.rs 0r ~/.vim/templates/skeleton.rs
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
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
imap jj <esc>

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

" Lightline status bar, makes status bar pretty
Plug 'itchyny/lightline.vim'

" Latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" ALE Linter
Plug 'dense-analysis/ale'

" rust.vim
Plug 'rust-lang/rust.vim'

" powershell.vim
Plug 'pprovost/vim-ps1'

" Vim wiki plugin
Plug 'vimwiki/vimwiki'

call plug#end()
