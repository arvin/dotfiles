" Minimal vim settings without plugins/bundles
let mapleader='\'

" Basic settings
set number "sets numbers
set softtabstop=2
set autoindent
set cindent
set vb " turns off visual bell
set history=50 " keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
set incsearch " do incremental searching
set hidden
set backspace=indent,eol,start 
set wildmenu
set tabstop=2
set shiftwidth=2
set cursorline
set cursorcolumn
set nowrap
set hlsearch
set ignorecase
set noswapfile
syntax on

if ! has("gui_running") 
	set t_Co=256 
endif 
set background=dark
colorscheme peaksea 

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Ignore certain filetypes
set wildignore+=*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.pyc
set wildignore+=*.o,*.d

" Set up omnicomplete files
autocmd Filetype python ab ifname if __name__ == '__main__':<CR>
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
	!git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" Vundle setup
set nocompatible
filetype off " Needs to be on for vim versions < 7.4.430 (https://github.com/gmarik/vundle/issues/176)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Declare vundle bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/peaksea'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/blackboard.vim'

filetype plugin indent on " Required for vundle

" CtrlP Options
let g:ctrlp_map = '<leader>t'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 200000
let g:ctrlp_clear_cache_on_exit = 0
map <leader>b :CtrlPBuffer<CR>

" YankRing Options
map <leader>y :YRShow<CR>

" AutoComplPop Options
let g:acp_behaviorPythonOmniLength = -1

" Turn on Rainbow Parens by default
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set tags=tags;/
nnoremap <silent> <Leader>b :TagbarToggle<CR>

