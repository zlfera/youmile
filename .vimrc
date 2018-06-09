set encoding=utf-8
set nocompatible
filetype off
""set rtp+=~/.vim/bundle/Vundle.vim
set number
set mouse=n
set nobackup
set noswapfile
""set nowritebackup
set wildmenu
set autowrite
set smartcase
set scrolloff=3
set backspace=2
set expandtab
set shiftwidth=2
set cursorline
set softtabstop=2
set tabstop=8
set shortmess=atI
set autoindent
set t_Co=256
""call vundle#begin()
call plug#begin('~/.config/nvim/plugged')
""""""
""Plugin 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
""let g:NERDTreeDirArrows=0
""Plugin 'skywind3000/asyncrun.vim'
""Plugin 'posva/vim-vue'
""Plugin 'chemzqm/wxapp.vim'
Plug 'w0rp/ale'
let &runtimepath.=',~/.config/nvim/plugged/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
""Plugin 'vim-syntastic/syntastic'
""let g:syntastic_ruby_checkers = ['rubocop']
""let g:syntastic_javascript_checkers = ['jshint']
""let g:syntastic_check_on_open = 1
""let g:syntastic_error_symbol = '✗'
""let g:syntastic_warning_symbol = '⚠'

""let g:syntastic_auto_loc_list = 1
""let g:syntastic_loc_list_height = 5
""let g:syntastic_enable_highlighting = 0
""let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""Plugin 'tpope/vim-rails'
""Plugin 'vim-ruby/vim-ruby'
""Plugin 'kien/ctrlp.vim'
""hi PmenuSel ctermbg=lightblue
""let g:ctrlp_map = '<c-p>'
""let g:ctrlp_cmd = 'CtrlP'
""set wildignore+=*/tmp/*,*.so,*.swp,*.zip
""let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ "Unknown"   : "?"
\ }
""Plug 'drmingdrmer/xptemplate'
""let g:xptemplate_key = '<Tab>'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plug 'chemzqm/wxapp.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sheerun/vim-polyglot'
"Plugin 'mxw/vim-jsx'
""""""
""call vundle#end()
call plug#end()
map <C-a> :NERDTreeToggle<CR>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
"inoremap < <><ESC>i
filetype plugin indent on
