set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()		" required, all plugins must appear after this line.

Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'vim-airline/vim-airline'					" Airline
Plugin 'vim-airline/vim-airline-themes'				" Airline Themes
Plugin 'scrooloose/nerdtree'						" added nerdtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-python/python-syntax'
Plugin 'jreybert/vimagit'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vimwiki/vimwiki'                            " Vim wiki
Plugin 'ap/vim-css-color'                           " Color previews for CSS
"Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'ying17zi/vim-live-latex-preview'
Plugin 'tpope/vim-surround'                         " Change surrounding marks
"Plugin 'klen/python-mode'                          " Python Mode

call vundle#end()		" required, all plugins must appear before this line.

execute pathogen#infect()
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
map <C-v> "+P

set rtp+=/usr/share/powerline/bindings/vim/

set laststatus=2

set t_Co=256

syntax on   
set relativenumber
set number
set showcmd
let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

set noshowmode

set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1


let g:minimap_show='<leader>mm'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'

hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3

set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set nobackup
set noswapfile

map <C-p> :LLPStartPreview<CR>
let g:livepreview_previewer = 'zathura'
let g:minimap_highlight='Visual'

let g:python_highlight_all = 1
syntax on

