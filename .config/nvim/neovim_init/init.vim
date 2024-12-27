if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'itchyny/lightline.vim'                      " Vim Lightline
" Plug 'vim-airline/vim-airline-themes'             " Airline Themes
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'                            " vimwiki
Plug 'chrisbra/Colorizer'                         " color from rgb
Plug 'AndrewRadev/id3.vim'                        " id3tag editor
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'sainnhe/gruvbox-material'
Plug 'lervag/vimtex'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plug 'ericbn/vim-solarized'
" Plug 'autozimu/LanguageClient-neovim'
" Plug 'junegunn/fzf.vim'                           " vim fzf
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

" set ttyfast
" set lazyredraw
"
filetype plugin on

set number
" set relativenumber

set encoding=utf-8

set splitbelow splitright

set noruler

set laststatus=0

set noshowcmd
set noshowmode

set nohlsearch
" no <leader>/ <cmd>nohlsearch<CR>

set wildmode=longest,list,full

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


:imap jj <Esc>
map <Space> <PageDown>

" nnoremap <silent> K 10j
" nnoremap <silent> L 10k

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
map <leader>h :ColorHighlight

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
map <leader>p :!opout "%:p"<CR>
autocmd VimLeave *.tex !texclear %

nnoremap <silent> <leader>u :Urlview<CR>

set autoindent
set smartindent

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1

set termguicolors

colorscheme gruvbox-material

autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
highlight Normal guibg=NONE ctermbg=NONE



let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ }

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' C:'
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = '☰ '

" let s:hidden_all = 0
" function! ToggleHiddenAll()
"     if s:hidden_all  == 0
"         let s:hidden_all = 1
"         set noshowmode
"         set noruler
"         set laststatus=0
"         set noshowcmd
"     else
"         let s:hidden_all = 0
"         set showmode
"         set ruler
"         set laststatus=2
"         set showcmd
"     endif
" endfunction
" nnoremap <leader>h :call ToggleHiddenAll()<CR>

" let g:vimtex_view_method = 'zathura'
" let g:vimtex_compiler_method = 'latexmk'
" let g:ale_completion_autoimport = 1
" let g:ale_completion_enabled = 1

":vimwiki ext
let g:vimwiki_list = [{'path': '~/.config/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]



:lua <<EOF

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }

EOF
