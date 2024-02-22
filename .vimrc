call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

call plug#end()

" Key mappings
nnoremap <SPACE> <Nop>
let mapleader=" "

" Access to the system keyboard
map <leader>y "+y
map <leader>p "+p
command W w
command Q q
command Wq wq
command WQ wq
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>n :bnext<CR>
nnoremap <C-\> <C-^>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap gd <C-]>

" fzf
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND='rg --hidden -l ""'

" General config
syntax on
filetype on

set ttyfast			 " push more characters through to the terminal per cycle
set lazyredraw                   " don't update the screen during commands
set nu
set nowrap
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set autoread    		 " Auto update read-only files
set autoindent
set splitbelow
set splitright
set colorcolumn=80
set scrolloff=999

" Customize session options. Namely, I don't want to save hidden and
" unloaded buffers or empty windows.
set sessionoptions="curdir,folds,help,options,tabpages,winsize"

" Backup settings
set backupdir=~/vim.bak
set backup
set writebackup

" Show matching brackets
set showmatch

" Matching settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.swp         " Ignore vim backups

" Auto generate tags file on file write of .py files
autocmd BufWritePost *.c,*.h,*.cpp,*.hpp,*.java,*.php,*.js,*.py,*.rb,*.sh,*.html,*.css,*.xml,*.pl,*.sql,*.lua,*.swift,*.go,*.dart,*.ts silent! !ctags .

" Reopen at last closed line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <Leader>vm :vsp ~/.vimrc<CR>

" Generate helptags, must be set at end
silent! helptags ALL
set secure
