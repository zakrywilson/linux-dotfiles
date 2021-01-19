"------------------------------------------------------------------------------
"
" Vimrc (zachjwilson)
"
"------------------------------------------------------------------------------


" Vundle - Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle - Initialize
call vundle#begin()

" Vundle - Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'HerringtonDarkholme/yats'
Plugin 'RRethy/vim-illuminate'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'daviesjamie/vim-base16-lightline'

" Vundle - List all plugins must be listed above (required)
call vundle#end()

" Change leader to comma
let mapleader=';'

" Use new version of Vim
set nocompatible

" TODO: YouCompleteMe

" TODO: codefmt

" TODO: Syntastic

" Enable file-specific indentation
filetype plugin indent on

" Turn syntax on
syntax on

" Color
set t_Co=256

" Base16 (source https://github.com/chriskempson/base16-shell)
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Line numbers - Use both relative and absolute
set number relativenumber

" Disable quote concealing in JSON files
autocmd Filetype json let g:indentLine_setConceal = 0

" Line numbers - Use relative when editing only
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Retab on file open
retab

" Enable wild menu
set wildmenu

" Show matching parenthesis
set showmatch

" Use visual bells
set visualbell

" Enable history and undo
set history=1000
set undolevels=1000
set undofile
set undodir=~/.vim/undo

" Disable swap and backup files
set noswapfile
set nobackup

" Search highlighting - Move the cursor to the matched string
set incsearch

" Search highlighting - This combo allows for caps searches to find only caps
" words while lowercase searches use a smart search algorithm
set ignorecase
set smartcase

" Set Esc-Esc to disable highlight
nnoremap <ESC><ESC> :noh<CR>

" CtrlP - Use RipGrep instead of Grep
if executable("rg")
  set grepprg=rg\ --color=never\ --smart-case\ --vimgrep
  let g:ctrlp_user_command = 'rg %s --files --no-ignore --hidden --smart-case --follow --glob "!{.git,.svn,.hg,review,.git5_specs}/*" --color=never 2> /dev/null'
endif

" TODO GitGutter config

" NERDTree - Open automatically if file is a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" NERDTree - Close NERDTree and exit Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree - Set arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTree - Open with Ctrl-n
noremap <C-n> :NERDTreeToggle<CR>

" Airline theme

" TODO What does this even do?
let g:airline#extensions#tabline#enabled=1

" Lightline - Configure Lightline
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Lightline - Enable Powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Lightline - Fix unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Lightline - Add Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Vim Tmux Nagivator - Disable when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Tab navigation: move between buffers with alt+arrow
nmap <silent> <A-UP> :bfirst<CR>
nmap <silent> <A-DOWN> :blast<CR>
nmap <silent> <A-LEFT> :bprevious<CR>
nmap <silent> <A-RIGHT> :bnext<CR>


"---------------------------------------------------------------
" Old
"---------------------------------------------------------------

" Display whitespace characters "
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Set different tabs for other files "
if has("autocmd")
  augroup styles
    au FileType java,go set tabstop=4 shiftwidth=4
  augroup END
endif

" Disable whitespace checks for markdown
autocmd FileType markdown let g:better_whitespace_enabled=0

" Indent line setting "
let g:indentLine_char = '┊'

