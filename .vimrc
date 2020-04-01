let mapleader =","

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()		" required, all plugins must appear after this line.

Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'vim-airline/vim-airline'					" Airline
Plugin 'vim-airline/vim-airline-themes'				" Airline Themes
Plugin 'chrisbra/unicode.vim'                       " unicode search
Plugin 'PotatoesMaster/i3-vim-syntax'               " i3-syntax
Plugin 'chrisbra/Colorizer'                         " color from rgb
Plugin 'flazz/vim-colorschemes'                     " vim colorscheme
Plugin 'vimwiki/vimwiki'                            " vimwiki
Plugin 'mcchrish/nnn.vim'                           " nnn file picker

call vundle#end()		" required, all plugins must appear before this line.

"execute pathogen#infect()
filetype plugin indent on    " required


"Remap ESC to ii
:imap ii <Esc>

"Disable arrow keys in Normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

"Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"Copy paste Clipboard Access:

vnoremap <C-c> "+y
map <C-z> "+P


" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>s :setlocal spell! spelllang=en_us<CR>

syntax on   

set rtp+=/usr/share/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set encoding=utf-8
set relativenumber
set number
set showcmd
set noshowmode
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set hlsearch

set splitbelow splitright

let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized_flood'

colorscheme solarized8_dark


map <C-n> :Np<CR>

hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3


set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile

let g:python_highlight_all = 1
syntax on

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>


map <leader>h :ColorHighlight
noremap <leader>u :w \| startinsert \| term urlview %<cr>
":nnoremap <leader>u :silent w\|!urlview %<CR>

":vimwiki ext
let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
