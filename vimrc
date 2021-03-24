"*****************************************************************************
" Plugins (using vim.plug, '~/.vim/autoload/plug.vim')
"*****************************************************************************
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/seoul256.vim'
call plug#end()


"*****************************************************************************
"" General config
"*****************************************************************************
let mapleader=','


"*****************************************************************************
"" Plugin's setup
"*****************************************************************************

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <leader>t :NERDTreeFind<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

"" Ale (async linters)
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 1
let g:ale_completion_autoimport = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {'python': ['black', 'isort'], 'json': ['jq']}
let g:ale_linters = {'gitcommit': ['proselint'], '`markdown`': ['proselint'], 'python': ['flake8'], 'text': ['proselint']}
let g:ale_python_flake8_args = ' --ignore=E501'

"" FZF
map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>rg :Rg<CR>

"" Jedi (AutoCompletion tool for python)
autocmd FileType python setlocal completeopt-=preview " Disable popup doc during completion

"" Seoul Theme
colo seoul256
" colo seoul256-light

set background=dark
let g:seoul256_background = 180
" set background=light


"*****************************************************************************
"" General setup
"*****************************************************************************
set clipboard=unnamedplus
