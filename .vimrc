set nocompatible
filetype off
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
" Visual stuff
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/vim-emoji'

" Syntax highlighting
Plugin 'chrisbra/Colorizer'
Plugin 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plugin 'hail2u/vim-css3-syntax'
Plugin 'wavded/vim-stylus', { 'for': 'styl' }
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'python-mode/python-mode'
Plugin 'dearrrfish/vim-applescript'
"Plugin 'vim-scripts/appslescript.vim'

" Snippets & autocomplete
Plugin 'lifepillar/vim-mucomplete'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'epilande/vim-react-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'jiangmiao/auto-pairs'

" Functionality
Plugin 'djoshea/vim-autoread'
Plugin 'sjl/vitality.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
"Plugin 'vim-scripts/indenthtml.vim'
Plugin 'drmikehenry/vim-fixkey'
"Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'

" Vim + git
Plugin 'tpope/vim-fugitive'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" Buffer management
Plugin 'jeetsukumaran/vim-buffergator'

" Move lines & blocks
Plugin 'matze/vim-move'

" View file tree
Plugin 'scrooloose/nerdtree'

" View undo tree
Plugin 'sjl/gundo.vim'

" Comments
Plugin 'scrooloose/nerdcommenter'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Syntax checker/linter
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" Speed
set regexpengine=1
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" Set filetypes
autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufNewFile,BufRead *.applescript set filetype=applescript

" Fold settings
"augroup vimrc
"au BufReadPre * setlocal foldmethod=indent
"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

" Disable modelines for security
set modelines=0

" Set tab spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType javascript   setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType coffeescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python       setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby         setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c            setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
"autocmd BufRead * :normal gg=G

" General settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set number relativenumber
set undofile
"autocmd BufEnter * silent! lcd %:p:h

" Map leader
let mapleader = "\<Space>"

" Easy :
nnoremap ; :
nnoremap : ;

" Map jj to ESC
inoremap jj <ESC>

colorscheme landscape

" Search settings
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Map tab to move around in brackets
nnoremap <tab> %
vnoremap <tab> %

" Text wrap
set wrap
set textwidth=79
set formatoptions=qrn1

" Show tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" Remap arrow keys
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv
nnoremap j gj
nnoremap k gk

" Save on focus lost
autocmd BufLeave,FocusLost * silent! :wa

" Set NERDTree bindings
nnoremap <leader>3 :NERDTreeToggle<CR>
nnoremap <leader>4 :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let NERDTreeQuitOnOpen=1

nnoremap <leader>ft Vatzf
nnoremap <leader>v V`]
nnoremap <leader>ew <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

if !exists("g:airline_symbols")
	let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb

let g:goldenview__enable_default_mapping = 0

let g:move_key_modifier = 'C'

"let g:buffergator_suppress_keymaps = 1
nnoremap [[ :BuffergatorMruCyclePrev<CR>
nnoremap ]] :BuffergatorMruCycleNext<CR>

nnoremap <C-x> *``cgn
nnoremap <C-X> #``cgN

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
:command Sd SyntasticToggleMode

let g:ycm_server_python_interpreter = 'python2'

let g:user_emmet_leader_key='\'

"let g:AutoPairsShortcutFastWrap= '<C-e>'

let g:indentLine_enabled = 1
let g:vim_json_syntax_conceal = 0

nnoremap <CR> za

let g:vim_markdown_folding_disabled = 1

set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1


