set mouse=a  " enable mouse
set encoding=utf-8
" set updatetime=330
set number
set noswapfile
" set scrolloff=7
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix


filetype indent on      " load filetype-specific indent files

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'   " tree project
Plug 'vim-airline/vim-airline' " bottom line 

Plug 'chrisbra/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } } " fuzzy search
Plug 'junegunn/fzf.vim' 
" git 
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-pyright']
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv']

set colorcolumn=78
colorscheme gruvbox " set colorscheme
inoremap jk <esc>
map <C-_> :Commentary<CR>


" nvim buffers
map gn :bn<cr>
map gp :bp<cr>

" All extensions COC lts
" noremap <C-P> :NERDTreeFocus<Cr>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" fuzzy search by files
noremap <C-S> :Files<CR>
noremap <C-s> :Rg<CR>

noremap <C-Left> :tabn<CR>
noremap <C-Right> :tabp<CR>
" map write 
noremap <Space>w :w<CR>
noremap <Space>W :wq<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
