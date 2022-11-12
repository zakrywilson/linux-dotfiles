"------------------------------------------------------------------------------
"
" Vimrc (zachjwilson)
"
"------------------------------------------------------------------------------

" TODO: Switch to Plug

" Vundle - Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle - Initialize
call vundle#begin()

" Vundle - Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
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

" UTF-8 encoding
set encoding=utf-8

" Use the mouse
set mouse=a

" Space as Leader
let mapleader=" "

" Use new version of Vim
set nocompatible

" Turn on syntax highlighting
syntax on

" Make colors better
set t_Co=256

" Enable file-specific indentation
filetype plugin indent on

" Reload Vim config
nnoremap <leader>R :source ~/.vimrc<CR>

" Edit Vim config
nnoremap <leader>.n :e ~/.vimrc<CR>

" Edit Tmux config
nnoremap <leader>.t :e ~/.tmux.conf<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'STIORAMVCXZDHYWUFLPKBQ;JGNE' " nice for Colemak
let g:EasyMotion_force_csapprox = 1
map <Leader>s <Plug>(easymotion-sn)
omap <Leader>s <Plug>(easymotion-tn)
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_disable_two_key_combo = 1

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

" Show when Leader is active
set showcmd

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

" Search highlighting - This combo allows for caps searches to find only caps
" words while lowercase searches use a smart search algorithm
set ignorecase
set smartcase

" Make splits make sense
set splitbelow
set splitright

" Toggle search highlight
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

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

