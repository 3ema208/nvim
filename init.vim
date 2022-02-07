set mouse=a  " enable mouse
set encoding=utf-8
set updatetime=200
set number
set noswapfile
" set scrolloff=7
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" filetype indent on      " load filetype-specific indent files
if has('mac')
    let g:python3_host_prog='/usr/bin/python3'
elseif 
    let g:python3_host_prog = '/usr/bin/python3.10'
endif

call plug#begin('~/.vim/plugged')
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'   " tree project
Plug 'vim-airline/vim-airline' " bottom line 
Plug 'f-person/git-blame.nvim'

Plug 'chrisbra/vim-commentary'

Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets' " snippets

Plug 'junegunn/fzf', {'do': { -> fzf#install() } } " fuzzy search
Plug 'junegunn/fzf.vim' 

" git
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
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

set colorcolumn=78
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
" fuzzy search by files
" noremap <C-S> :Files<CR>
noremap <C-S> :Rg<CR>

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


nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

vnoremap <S-down> dpV`]
vnoremap <S-up> dkPV`]

" Git 
nnoremap Gt :GitBlameToggle<CR>

