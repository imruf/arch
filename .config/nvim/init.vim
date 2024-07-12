if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'itchyny/lightline.vim'                      " Vim Lightline
Plug 'vimwiki/vimwiki'                            " vimwiki
Plug 'AndrewRadev/id3.vim'                        " id3tag editor
Plug 'chrisbra/Colorizer'                         " color from rgb
Plug 'sainnhe/gruvbox-material'
Plug 'lervag/vimtex'


" Plug 'junegunn/fzf.vim'                           " vim fzf
" Plug 'vim-airline/vim-airline-themes'             " Airline Themes
" Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
" Plug 'tjdevries/colorbuddy.nvim'                  " colorbuddy
" Plug 'overcache/NeoSolarized'                     " Neosolarized ColorScheme
" Plug 'mcchrish/nnn.vim'                           " nnn file picker
" Plug 'strboul/urlview.vim'                        " urlview
" Plug 'neoclide/coc.nvim', {'branch': 'release'}   " vim lsp and coc
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'rkulla/pydiction'                       " python library
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'vim-scripts/AutoComplPop'                   " autocomplete
" Plug 'vim-airline/vim-airline'				  " Airline
" Plug 'vim-airline/vim-airline-themes'			  " Airline Themes
" Plug 'flazz/vim-colorschemes'                   " vim colorscheme
" Plug 'chrisbra/unicode.vim'                     " unicode search

call plug#end()

let mapleader =","
let maplocalleader = ","


set relativenumber
set number

set noshowmode
set splitbelow splitright
set incsearch

set hlsearch
no <Esc> <cmd>nohlsearch<CR>

:imap jj <Esc>
map <Space> <PageDown>

nnoremap <silent> K 10j
nnoremap <silent> L 10k

no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>sp :sp
map <leader>sv :vsp

map gz :bdelete<cr>
map gb :bnext<cr>
map gB :bprev<cr>

map <leader>te :tabe
map <leader>tn :tabnew<cr>
map <leader>tx :tabnext
map <leader>tp :tabprev
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>


vmap <leader>xy :!xclip -f -sel clip<CR>
map <leader>xp mz:-1r !xclip -o -sel clip<CR>`z

cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"


map <leader>s :setlocal spell! spelllang=en_us<CR>

map <leader>c :w! \| !compiler <c-r>%<CR>
map <leader>p :!opout <c-r>%<CR><CR>

map <leader>h :ColorHighlight
nnoremap <silent> <leader>u :Urlview<CR>

syntax on
set autoindent
set smartindent

set termguicolors
set background=dark
colorscheme gruvbox

":vimwiki ext
let g:vimwiki_list = [{'path': '~/.config/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]




" dwmblocks autocompile
autocmd BufWritePost ~/Downloads/Git/dwmblocks/config.h !cd ~/Downloads/Git/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
