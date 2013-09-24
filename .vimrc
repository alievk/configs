" vim: foldmethod=marker
" ==============================================================================
" "Todo" Добавить {{{1
" ==============================================================================

" TODO: fugitiv
" TODO: fuzzyfinder
" TODO: vim-gitgutter 
" TODO: spell checking, autocomplete and synonyms

" TODO: session managment
" SessionMan

" TODO: project managment
" exvim MyProject 

" TODO: prepare and cleanup configs
" write README about install and add screenshots

" ==============================================================================
" "Tips" Заметки {{{1
" ==============================================================================

" set guifont=Consolas:h11:cDEFAULT

" ==============================================================================
" "Keybindings" Настройки хоткеев {{{1
" ==============================================================================

let g:mapleader = ","

"call togglebg#map("<leader>b")
nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
map <leader>v :e! $MYVIMRC<CR>
nnoremap <silent> <leader>h :set invhlsearch<CR>
comm! W exec 'w !sudo tee % > /dev/null' | e!

"nnoremap <Space> @q 
nnoremap ; :
map! ii <Esc>
map! jj <Esc>o<Esc>
map! kk <Esc>k
map! ;; ;<Esc>o
"inoremap <CR> <Esc>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
nmap <up> <nop>
nmap <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

" ==============================================================================
" "Vundle" Package manager {{{1
" ==============================================================================

" >> "Installing"  "{{{2

filetype off

if executable("git")
    if !isdirectory(expand("~/.vim/bundle/vundle"))
        echomsg "******************************"
        echomsg "Installing Vundler..."
        echomsg "******************************"
        !mkdir -p ~/.vim/bundle && git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        let s:bootstrap=1
    endif

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    if exists("s:bootstrap") && s:bootstrap
        unlet s:bootstrap
        BundleInstall
        quit
    endif
" }}}
" >> "Bundles and configs" {{{2

    Bundle 'colorizer'
    Bundle 'gmarik/vundle'
    Bundle 'majutsushi/tagbar' 
    "{{{3
        nmap <leader>tb :TagbarToggle<CR>
        let g:tagbar_autofocus = 1
        let g:tagbar_autoclose = 1
    " }}}
    Bundle 'mattn/gist-vim' 
    "{{{3
        let g:gist_update_on_write = 2
    " }}}
    Bundle 'mattn/webapi-vim'
    "Bundle 'nathanaelkane/vim-indent-guides.git' 
    "{{{3
        "let g:indent_guides_auto_colors = 1
        "let g:indent_guides_guide_size=1
        "let g:indent_guides_start_level=2
        "let g:indent_guides_enable_on_vim_startup=1
        ""hi IndentGuidesOdd  ctermbg=black
        ""hi IndentGuidesEven ctermbg=darkgrey
    " }}}
    Bundle 'Raimondi/delimitMate'
    Bundle 'scrooloose/nerdcommenter.git'
    Bundle 'SingleCompile' 
    "{{{3
        nmap <leader>sc :SCCompile<CR>
        nmap <leader>scr :SCCompileRun<CR>
    " }}}
    " >> new
    "Bundle 'Visual-Mark'
    "Bundle 'Yggdroot/indentLine'
    Bundle 'bling/vim-airline' 
    "{{{3
        let g:airline_theme='solarized'
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    " }}}
    Bundle 'bling/vim-bufferline'
    Bundle 'buddhavs/vim-tasklist'
    Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex' 
    "{{{3
        set grepprg=grep\ -nH\ $*
        let g:tex_flavor='latex'
        let g:Tex_DefaultTargetFormat='pdf'
    " }}}
    Bundle 'godlygeek/tabular'
    Bundle 'gregsexton/gitv'
    Bundle 'Gundo'
    Bundle 'dbakker/vim-lint'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'lyokha/vim-xkbswitch' 
    " {{{3
        let g:XkbSwitchIMappingsSkipFt = ['tex'] " need for latex-suite
        let g:XkbSwitchEnabled = 1
        "let g:XkbSwitchLib = '~/.vim/bundle/vim-xkbswitch/xkb-switch/libxkbswitch.so'
        let g:XkbSwitchIMappings = ['ru']
    " }}}
    Bundle 'Mark'
    Bundle 'tsaleh/vim-matchit'
    Bundle 'tpope/vim-repeat'
    Bundle 'a.vim'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/syntastic' 
    "{{{3
        let g:syntastic_python_python_exe = 'python2'
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
    "}}}
    Bundle 'SirVer/ultisnips'
    Bundle 'TaskList.vim'
    Bundle 'tpope/vim-fugitive.git'
    Bundle 'tpope/vim-surround'
   " Bundle 'Valloric/YouCompleteMe' 
    "{{{3
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_global_ycm_extra_conf = '/home/abcdw/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
        let g:ycm_key_list_select_completion = []
        let g:ycm_key_list_previous_completion = []
    " }}}
    Bundle 'vimwiki/vimwiki'

    " "Colorschemes"  {{{3
        Bundle 'altercation/vim-colors-solarized.git'
        Bundle 'cschlueter/vim-wombat'
        Bundle 'jnurmine/Zenburn'
        Bundle 'tomasr/molokai'
        Bundle 'chriskempson/base16-vim'

        "set term=xterm-256color
        let g:solarized_termcolors=256
        let g:solarized_visibility="low"
        let g:base16colorspace=256
        set t_Co=256
        set background=light
        " colors solarized
        colorscheme zenburn
        " colorscheme mustang
        " colorscheme molokai
        set colorcolumn=80

    " }}}
" }}}
    filetype plugin indent on

endif

" ==============================================================================
" "General" Основные настройки {{{1
" ==============================================================================

syntax on

set mouse=a
set langmenu=ru
set helplang=ru
set backspace=indent,eol,start " Set for maximum backspace smartness"
set nocompatible
set fileencodings=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set smarttab

set scrolloff=3 " don't scroll any closer to top/bottom
set sidescrolloff=5 " don't scroll any closer to left/right
set listchars=tab:»·,trail:·,nbsp:+,eol:¶,nbsp:&,extends:>,precedes:>,conceal:~
set list
set display+=uhex " Show unprintables as <xx>
set display+=lastline

set cindent

set nowrap " Soft (without changing text) wrapping.
set linebreak " Only wrap on characters in `breakat`
if has('multi_byte')
    let &showbreak = '↳ '
else
    let &showbreak = '> '
endif

set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set nolazyredraw
set number
set ruler
set autoread
"set autochdir

"
" Status bar and command line settings
"
set cmdheight=1         " Less Hit Return messages
set laststatus=2        " Always show status bar
set report=0            " Always report line changes for : commands
set ruler               " Show cursor location
set shortmess=aoOtT     " Abbreviate the status messages
set showmode            " Show mode I'm in
set showcmd             " Show command I'm typing
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set timeoutlen=500

set foldenable
set foldnestmax=3

" Command line completion:
set wildchar=<TAB>      " Character to start command line completion
set wildmenu            " Enhanced command line completion mode
set wildmode=longest:full,full

set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.pyd,*.class,*.lock
set wildignore+=*.png,*.gif,*.jpg,*.ico
set wildignore+=.git,.svn,.hg

set formatoptions-=o    " dont continue comments when pushing o/O
set linespace=1 " add some line space for easy reading
set cursorline

" exec 'autocmd VimLeavePre * silent mksession!' . s:lastsession_file
"set spelllang=ru_yo,en_us
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set iminsert=0
"set imsearch=0
"set imdisable

if has("autocmd")
  autocmd VimEnter * nested call SetupCtrlP()
endif

" ==============================================================================
" "Files" Настройки для файлов {{{1
" ==============================================================================

" Кодировка по умолчанию
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1251
set fileformat=unix " Формат файла по умолчанию
set fileformats=unix,dos,mac " Порядок определения формата файла

" ==============================================================================
" "Backup,Undo,Swap" Резервное копирование {{{1
" ==============================================================================

if isdirectory($HOME . '/.vim/backup') == 0
    silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
if has("autocmd")
    autocmd BufWritePre * nested let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'
endif

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
    silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
    set undolevels=1000 " maximum number of changes that can be undone
    set undoreload=10000 " maximum number lines to save for undo on a buffer reload
endif

" ==============================================================================
" "Functions" Пользовательские функции {{{1
" ==============================================================================

function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained * nested CtrlPClearCache
      autocmd BufWritePost * nested CtrlPClearCache
    augroup END
  endif
endfunction

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

set secure

"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf = 'texi2pdf $*'
