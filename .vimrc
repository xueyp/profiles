"vim:=marker fdl=0 fdls=0
" Check the operating system ------------------------------
if !exists( 'g:os' )
  if has( 'win32' ) || has( 'win64' )
    let g:os  = 'Windows'
  elseif has( 'win32unix' )
    let g:os = 'Cygwin'
  else
    let g:os  = substitute( system( 'uname' ), '\n', '', '')
    "g:os = Windows,Cygwin,Darwin,Linux
  endif
endif

" 前缀键修改
set showcmd
let mapleader=","
let maplocalleader = ';'
" USER Variable ------------------------------
let $VIMHOME=expand( $HOME . '/.vim/' )
let $USRVIMD=expand( $VIMHOME . 'myvim/' )
let $USRPLGD=expand( $USRVIMD . 'plugged/' )
let $USRSECD=expand( $USRVIMD.'sessions' )
let $USRTEMPD=expand( $USRVIMD . 'vimtemp/' )
if has( 'gui_running' )
  let $USRLWKDIR  =expand( $USRSECD.'/lastworkdirg' )
else
  let $USRLWKDIR  =expand( $USRSECD.'/lastworkdir' )
endif

" User functions ------------------------------

" Echo highlight functions 
if !exists( "*ColorEcho" )
  fu! ColorEcho( msg )
    let s:index = 0
    for item in split( a:msg, '|' )
      if !(s:index % 2)
        if item == ''
          let item = 'None'
        endif
        silent! exec 'echohl ' item
      else
        echon item
      endif
      let s:index +=1
    endfor
  endf
en

" Save working dir 
if !exists( '*Saveworkdir' )
  fu Saveworkdir()
    if g:os == 'Windows'
      silent! exec "!cd > " $USRLWKDIR
    else
      silent! exec "! pwd > " $USRLWKDIR
    endif
  endf
endif

" lcd to last working directory 
if !exists( '*Gotoworkdir' )
  fu Gotoworkdir()
    if ( !empty(glob( $USRLWKDIR )) )
      if g:os != 'Windows'
        lcd `=system( 'cat ' . $USRLWKDIR )`
      else
        lcd `=system( 'type ' . $USRLWKDIR )`
      endif
    endif
  endf
endif

" General configuration {{{  ------------------------------

" Vim settings 
"显示行号"
set number
" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Monaco:h13         
syntax on    "开启语法高亮"
let g:solarized_termcolors=256    "solarized主题设置在终端下的设置"
set background=dark        "设置背景色"
"set nowrap    设置不折行"
set wrap
set textwidth=80
set fileformat=unix    "设置以unix的格式保存文件"
set cindent        "设置C样式的缩进格式"
set tabstop=4    "设置table长度"
set shiftwidth=4        "同上"
set showmatch    "显示匹配的括号"
set scrolloff=5        "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set backspace=2
set mouse-=a        "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab        "不允许扩展table"
set whichwrap+=,h,l
set autoread
set cursorline        "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set nocp
set clipboard=exclude:.*   "禁用系统剪切板共享，否则会因为X11 Forwarding降低启动速度"
" Auto change to the current directory 
set acd

" Auto complete of vim command-line 
set wmnu

" Show position of cursor at status line 
set ruler

" Autochdir 
set autochdir

" Auto indent 
if has('autocmd')
  filetype plugin indent on
endif

" Copy indent 
set autoindent

" Smart indent 
set smartindent

" Smart table 
set smarttab

" Use space for tab 
set expandtab

" Set wrap, list disables line break 
set wrap lbr tw=0 wm=0 nolist

" Fold fill char 
set fillchars=vert:\|,fold:-

" Encodings 
" Encoding for file 
set fenc=utf-8

" Encoding for file's content 
"   If you want gvim under windws prompt
"   callback of shell command correctly
"   you need the following settings:
"   set enc=chinese
set enc=utf-8
scriptencoding utf-8

" Encoding for term 
set termencoding=utf-8

" Supported encoding 
set fencs=usc-bom,
      \utf-8,
      \chinese,
      \cp936,
      \gb18030,
      \big5,
      \euc-jp,
      \euc-kr,
      \latin1

" Supported filefomart 
" auto detect mac,unix,dos
set ffs=mac,unix,dos

" Vim message encoding 
language messages en_US.utf-8

" set swap directory 
if !isdirectory( $USRTEMPD )
  if g:os == 'Windows'
    silent! exec '!mkdir ' $USRTEMPD
  else
    silent! exec '!mkdir -p ' $USRTEMPD
  endif
endif
set backupdir =$USRTEMPD
set directory =$USRTEMPD
set undodir =$USRTEMPD

" Press K to show help of keyword under cursor 
set keywordprg=:help

" Open help window vertically 
augroup vertichelp
  au!
  au FileType help
        \ wincmd L |
        \ vertical res 80
augroup END

" Plugin admin ------------------------------
" vim-plug https://github.com/junegunn/vim-plug
if !empty( glob( expand( $VIMHOME . 'autoload/plug.vim' ) ) )
  " Add Plug owner/projname then run PlugInstall
  " The root of plug is $USRPLGD
  call plug#begin( $USRPLGD )
    Plug 'lilydjwg/fcitx.vim'
    Plug 'Konfekt/FastFold'
    Plug 'thinca/vim-quickrun'
    Plug 'tyru/open-browser.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'frazrepo/vim-rainbow'
    Plug 'Lokaltog/vim-powerline'
    Plug 'powerline/fonts', { 'do' : './install.sh'}
    "Plug 'thaerkh/vim-workspace'
    "Plug 'vim-syntastic/syntastic'
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-fugitive' " git plugin
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'Chiel92/vim-autoformat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown',{'for': 'markdown'}
    "yaourt nodejs npm ,sudo npm -g install instant-markdown-d"
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
    Plug 'kannokanno/previm'
    "Plug 'kien/ctrlp.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'dyng/ctrlsf.vim'
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'derekwyatt/vim-scala'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'tell-k/vim-autopep8'
    Plug 'pangloss/vim-javascript'
    Plug 'mattn/emmet-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'elzr/vim-json'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'dstein64/vim-startuptime'
  call plug#end()
endif

" Color theme ------------------------------
colorscheme solarized
" Solarized
if isdirectory( $USRPLGD . 'vim-colors-solarized' )
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set t_Co=256
  syntax enable
  if has('gui_running')
    set bg=light
  else
    set bg=dark
  endif
  colo solarized
endif

" Vim-workspace configuration ------------------------------
if isdirectory( $USRPLGD . 'vim-workspace' )
  "Auto create session
  let g:workspace_autocreate =1
  " Disable autosave
  let g:workspace_autosave = 0
  let g:workspace_undodir=$USRTEMPD . 'undodir'
  " Compatibility with vim and gvim {{{
  if has( 'gui_running' )
    let g:workspace_session_name = 'gsession.vim'
  else
    let g:workspace_session_name = 'session.vim'
  endif
  augroup workdir
    au!
    au VimEnter * call Gotoworkdir()
    au VimLeave * call Saveworkdir()
  augroup END
endif

" open-browser --------------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-rainbow --------------------------------------------
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

" instant-markdown---------------------------------------
let g:instant_markdown_autostart = 0
nnoremap <leader>P :InstantMarkdownPreview<CR>

" vim-go----------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" nvim-r----------------------------------------
let R_path = '/usr/bin'
"let R_external_term = 0
command RStart let oldft=&ft | set ft=r | exe 'set ft='.oldft | let b:IsInRCode = function("DefaultIsInRCode") | normal <LocalLeader>rf
nmap <silent> <LocalLeader>rk :call RStart<CR>
"" Use Ctrl+Space to do omnicompletion:
if has('nvim') || has('gui_running')
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
if has('gui_running') || &termguicolors
  let rout_color_input    = 'guifg=#9e9e9e'
  let rout_color_normal   = 'guifg=#ff5f00'
  let rout_color_number   = 'guifg=#ffaf00'
  let rout_color_integer  = 'guifg=#feaf00'
  let rout_color_float    = 'guifg=#fdaf00'
  let rout_color_complex  = 'guifg=#fcaf00'
  let rout_color_negnum   = 'guifg=#d7afff'
  let rout_color_negfloat = 'guifg=#d6afff'
  let rout_color_date     = 'guifg=#00d7af'
  let rout_color_true     = 'guifg=#5dd685'
  let rout_color_false    = 'guifg=#ff5d5e'
  let rout_color_inf      = 'guifg=#10aed7'
  let rout_color_constant = 'guifg=#5fafcf'
  let rout_color_string   = 'guifg=#5fd7af'
  let rout_color_error    = 'guifg=#ffffff guibg=#c40000'
  let rout_color_warn     = 'guifg=#d00000'
  let rout_color_index    = 'guifg=#d0d080'
endif
nmap <silent> <LocalLeader>vl :call RAction("viewobj", ", howto='aboveleft vsp'")<CR>
nmap <silent> <LocalLeader>vt :call RAction("viewobj", ", howto='topleft 11sp', nrows=10")<CR>

" Airline configuration ------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='powerlineish'
"let g:Powerline_symbols= 'fancy'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.crypt = '??'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '??'
let g:airline_symbols.branch = '??'
let g:airline_symbols.paste = ''
"let g:airline_symbols.readonly = '??'
let g:airline_symbols.spell = 'SPELL'
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = '??'

" Syntastic configuration------------------------------
if isdirectory( $USRPLGD . 'syntastic')
  let g:syntastic_tex_checkers = ['chktex' ]
  let g:syntastic_text_checkers = ['language_check']
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_text_language_check_args = '--language=en-US'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endif

" YouCompleteMe configuration ------------------------------
" default config path
"let g:ycm_global_ycm_extra_conf = '~/.vim/myvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python interpreter path"
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"syntax complete"
let g:ycm_seed_identifiers_with_syntax=1
"complete in comments
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"complete in string
let g:ycm_complete_in_strings = 1
"number of char for active complete
let g:ycm_min_num_of_chars_for_completion=2
"auto close complete window
let g:ycm_autoclose_preview_window_after_completion=1
augroup complete
  au!
  au InsertLeave * if pumvisible() == 0|pclose|endif
augroup END
"no cache for complete functions
let g:ycm_cache_omnifunc=0
"use enter for slection
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'     

" NERDTree configuration ------------------------------
map <F2> :NERDTreeToggle<cr>
let NERDTreeChDirMode =1
"Show bookmark
let NERDTreeShowBookmarks =1
"Ingnore filetypes
let NERDTreeIgnore =['\~$', '\.pyc$', '\.swp$']
"window size
let NERDTreeWinSize =25

"Tagbar配置------------------------------
map <F3> :TagbarToggle<CR>

"NERDcommenter配置------------------------------
map <F4> <leader>ci <CR>

"code format------------------------------
noremap <F6> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1

"quickrun------------------------------
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
map <F5> :QuickRun<CR>

"java配置------------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete\

" Autopep8 configuration ------------------------------
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff=1

" coc configuration --------------------------------
let g:coc_global_extensions = ['coc-python','coc-go','coc-git','coc-clangd','coc-json','coc-r-lsp','coc-sql','coc-xml','coc-markdownlint']

" emmet-vim ------------------------------------
" 只在html和css文件中起作用
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstal
" 修改Emmet扩展键 实现F2补全
let g:user_emmet_expandabbr_key = '<F2>'
" 修改Emmet默认快捷键 将默认的<C-y>修改成<C-e>方便操作
let g:user_emmet_leader_key = '<C-e>'

" 对于vim的不同模式,可以在_vimrc有不同配置:
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" fzf ---------------------------------------------------
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

" ctrlsf ----------------------------------------------
let g:ctrlsf_backend = 'ack'
nnoremap <leader>W :CtrlSF

"User maps ------------------------------
" Escape 
inoremap jk <Esc>

" Switch window 
nnoremap nw <C-w><C-w>

" Close current window 
nnoremap ww <C-W>q

" gf to new tab 
nnoremap Gf <C-w>gf

" Omni completion 
imap <A-j> <C-x><C-o>

" Copy and paste a paragraph 
noremap cp yap<S-}>p

" Align current paragraph 
noremap ;a =ip

" Toggle paste mode 
set pastetoggle=;z

" Apply macro 
" use qq to recode, q to stop and Q to apply
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Copy to clipboard 
vnoremap ;x "*y

" Paste from clopboard 
nmap ;p "*p

" Vim-easy-align maps 
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Auto load vimrc when write 
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_runing') | so $MYGVIMRC | endif
augroup END
