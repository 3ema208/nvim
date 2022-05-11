set mouse=a  " enable mouse
set encoding=utf-8
set updatetime=100
set number
set noswapfile
" set scrolloff=7
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set wrap
set colorcolumn=78
set foldmethod=manual
set clipboard=unnamedplus
let mapleader=" "

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

au BufEnter *.js :vmap ^_ :s/^/\/\// <Enter> :nohlsearch <Enter>
au BufEnter *.py :vmap ^_ :s/^/#/ <Enter> :nohlsearch <Enter>

" filetype indent on      " load filetype-specific indent files
if has('mac')
    let g:python3_host_prog = '/usr/local/opt/python@3.10/bin/python3.10'
else 
    let g:python3_host_prog='/usr/bin/python3'
endif


call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'   " tree project
Plug 'vim-airline/vim-airline' " bottom line 
" colorscheme
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } } " fuzzy search
Plug 'junegunn/fzf.vim' 

" lsp
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" git
Plug 'airblade/vim-gitgutter'
call plug#end()

" coc-pylsp
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv']

colorscheme tokyonight " set colorscheme
inoremap jk <esc>

map <C-_> :Commentary<CR>
" nvim buffers
map gn :bn<cr>
map gp :bp<cr>

" All extensions COC lts
" noremap <C-P> :NERDTreeFocus<Cr>
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>r :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<cr>
" nnoremap <C-f> :NERDTreeFind<CR>

" Search
" noremap <C-S> :Files<CR>
noremap <leader>fw :Rg<CR>
noremap <leader>ww :Files<CR>

" Tabs
noremap <Space><Left> :tabn<CR>
noremap <Space>j :tabn<CR>

noremap <Space><Right> :tabp<CR>
noremap <Space>k :tabp<CR>

noremap <Space>ff :Format<CR>
" map write 
noremap <Space>ww :w<CR> 
noremap <Space>W :wq<CR>
noremap <leader>ss :vsplit<CR>
noremap <leader>h :noh<CR>

" GoTo code navigation.
noremap <leader>l :Format<CR>
" Movement
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

inoremap jj <Esc>

vnoremap <S-down> dpV`]
vnoremap <S-up> dkPV`]

" Git 
nnoremap Gt :GitBlameToggle<CR>

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true


lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require('lspconfig')['rust_analyzer'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
