let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'itchyny/lightline.vim'                      " Vim Lightline
Plug 'chrisbra/Colorizer'                         " color from rgb
Plug 'vimwiki/vimwiki'                            " vimwiki
Plug 'mcchrish/nnn.vim'                           " nnn file picker
Plug 'AndrewRadev/id3.vim'                        " id3tag editor
Plug 'junegunn/fzf.vim'                           " vim fzf
Plug 'strboul/urlview.vim'                        " urlview
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " vim lsp and coc
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

"execute pathogen#infect()
filetype plugin indent on    " required
filetype plugin on

"Remap ESC to jj 
:imap jj <Esc>

" Space to PageDown
map <Space> <PageDown>

" save as root !!
" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"

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

" Quick jump with K and L
nnoremap <silent> K 10j
nnoremap <silent> L 10k

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>sp :sp
map <leader>sv :vsp

" buffer management
map gz :bdelete<cr>
map gb :bnext<cr>
map gB :bprev<cr>

" tab management
map <leader>te :tabe
map <leader>tn :tabnew<cr>
map <leader>tx :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

"Copy paste Clipboard Access:
vmap <leader>xy :!xclip -f -sel clip<CR>
map <leader>xp mz:-1r !xclip -o -sel clip<CR>`z

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" color from hex code
map <leader>h :ColorHighlight

" urlview
nnoremap <silent> <leader>u :Urlview<CR>

" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on

set encoding=utf-8
set t_Co=256
set nocompatible
set laststatus=2

" set updatetime=300
" set shortmess+=c

set relativenumber
set number

set showcmd
set noshowmode
" set cmdheight=2

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set hlsearch
set incsearch

set hidden

" set cursorline
" set cursorcolumn

set sidescrolloff=999
set scrolloff=999

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.

set nobackup
set nowritebackup
set noswapfile

set splitbelow splitright

hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3


let g:python_highlight_all = 1

let g:rehash256 = 1
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ }

" fzf
set rtp+=/usr/bin/fzf
nnoremap <silent> <leader>f :AF<CR>

if exists('$TMUX')
  let g:fzf_prefer_tmux = 1
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -nargs=? -complete=dir AF
 \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
 \   'source': 'find ~/ -type f 2> /dev/null '.expand(<q-args>)
  \ })))

":vimwiki ext
let g:vimwiki_list = [{'path': '~/.config/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]


" python dict pydiction plugin
let g:pydiction_location = '/home/masud/.config/nvim/plugged/pydiction/complete-dict'
let g:pydiction_menu_height = 3

" nnn
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>nnn :NnnPicker<CR>
" let g:nnn#action = {
"             \ '<c-t>': 'tab split',
"             \ '<c-x>': 'split',
"             \ '<c-v>': 'vsplit'
"             \ }

" manpage with table of contents sidebar with neovim
 augroup manlaunchtoc
      autocmd!
      if has('nvim')
         autocmd FileType man
             \ call man#show_toc() |
             \ setlocal laststatus=0 number relativenumber |
             \ nnoremap <buffer> l <Enter> |
             \ wincmd V |
             \ resize 5 |
             \ wincmd p
     endif
 augroup end

" lsp
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" dwmblocks autocompile
autocmd BufWritePost ~/Downloads/Git/dwmblocks/config.h !cd ~/Downloads/Git/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
