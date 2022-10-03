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

Plug 'kwsp/halcyon-neovim'
" Rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
" lsp
" Plug 'hrsh7th/nvim-compe'
" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" git
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-pylsp
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv']

colorscheme tokyonight " set colorscheme
" inoremap jk <esc>

map <C-_> :Commentary<CR>
" nvim buffers
map gn :bn<cr>
map gp :bp<cr>

" All extensions COC lts
noremap <Space>ff :Format<CR>
" noremap <C-P> :NERDTreeFocus<Cr>
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>r :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<cr>

" Search
noremap <leader>fw :Rg<CR>

" Tabs
noremap <Space><Left> :tabn<CR>
noremap <Space>j :tabn<CR>

noremap <Space><Right> :tabp<CR>
noremap <Space>k :tabp<CR>

" map write 
noremap <Space>ww :w<CR> 
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
