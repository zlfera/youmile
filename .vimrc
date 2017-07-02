set encoding=utf-8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
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
call vundle#begin()
""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
""let g:NERDTreeDirArrows=0
""Plugin 'skywind3000/asyncrun.vim'
""Plugin 'posva/vim-vue'
""Plugin 'chemzqm/wxapp.vim'
Plugin 'w0rp/ale'
let &runtimepath.=',~/.vim/bundle/ale'
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
""Plugin 'kien/ctrlp.vim'
""hi PmenuSel ctermbg=lightblue
""let g:ctrlp_map = '<c-p>'
""let g:ctrlp_cmd = 'CtrlP'
""set wildignore+=*/tmp/*,*.so,*.swp,*.zip
""let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
Plugin 'Xuyuanp/nerdtree-git-plugin'
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
Plugin 'drmingdrmer/xptemplate'
let g:xptemplate_key = '<Tab>'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
"Plugin 'mxw/vim-jsx'
""""""
call vundle#end()
map <C-a> :NERDTreeToggle<CR>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
"inoremap < <><ESC>i
filetype plugin indent on
