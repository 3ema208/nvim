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

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=4 sts=4 sw=4

au BufEnter *.js :vmap ^_ :s/^/\/\// <Enter> :nohlsearch <Enter>
au BufEnter *.py :vmap ^_ :s/^/#/ <Enter> :nohlsearch <Enter>

" filetype indent on      " load filetype-specific indent files
if has('mac')
    let g:python3_host_prog = '/usr/bin/python3.10'
else 
    let g:python3_host_prog='/usr/bin/python3'
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'chrisbra/vim-commentary'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'   " tree project
Plug 'vim-airline/vim-airline' " bottom line 

Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'honza/vim-snippets' " snippets

Plug 'junegunn/fzf', {'do': { -> fzf#install() } } " fuzzy search
Plug 'junegunn/fzf.vim' 

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'
" colorscheme
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
" coc-pylsp
let g:coc_global_extensions = [
            \'coc-rust-analyzer', 
            \'coc-go', 
            \'coc-pyright', 
            \'coc-snippets',
            \'coc-rls', 
            \'coc-tsserver', 
            \'coc-eslint', 
            \'coc-json', 
            \'coc-prettier', 
            \'coc-css', 
            \'coc-emmet']

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv']

colorscheme tokyonight " set colorscheme
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
" nnoremap <C-f> :NERDTreeFind<CR>

" Search
" noremap <C-S> :Files<CR>
noremap <C-S> :Ag<CR>

" Tabs
noremap <C-Left> :tabn<CR>
noremap <C-Right> :tabp<CR>

command! -nargs=0 Format :call CocActionAsync('format')
" map write 
noremap <Space>w :w<CR>
noremap <Space>W :wq<CR>
" GoTo code navigation.
noremap <C-l>:Format<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Movement
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

vnoremap <S-down> dpV`]
vnoremap <S-up> dkPV`]

" Git 
nnoremap Gt :GitBlameToggle<CR>

