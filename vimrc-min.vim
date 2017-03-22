" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell

" cd %USERPROFILE%
" git clone https://github.com/gmarik/Vundle.vim.git vimfiles/bundle/Vundle.vim
" gvim _vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if !(has('win16') || has('win32') || has('win64'))
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
else
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'kshenoy/vim-signature'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'yegappan/mru'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vimoutliner/vimoutliner'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/TaskList.vim'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'vim-scripts/sessionman.vim'

" In the file vimfiles\bundle\vimoutliner\vimoutlinerc
" uncomment the following line for the comma comma keyboard mappings to work
" let maplocalleader = ',,'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" use internal diff program
set diffexpr=

" Basics {
    set nocompatible    " Use gVim defaults
    "source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/sh
    endif
" }

" Vim UI {
    syntax enable
    set background=dark
    colorscheme solarized

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    highlight clear LineNr          " Current line number row will have same background color in relative mode.
                                    " Things like vim-gitgutter will match LineNr highlight
    highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Consolas:h11,Courier_New:h11
        endif
        if has('gui_macvim')
            set transparency=5      " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen' || &term == 'ansi'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Key Mappings {

    map <leader>cd :cd %:p:h<cr>

    set winaltkeys=yes  " allows the Alt+Space menu to work on Windows

	nnoremap <c-j> <c-w><c-j>
	nnoremap <c-k> <c-w><c-k>
	nnoremap <c-l> <c-w><c-l>
	nnoremap <c-h> <c-w><c-h>

    " Code folding keys mappings {
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
    " }

    " Error window mapping {
    if has("win32")
        nnoremap <kPlus>     :cnext<CR>
        nnoremap <kMinus>    :cprev<CR>
        nnoremap <kMultiply> :cc<CR>
        nnoremap <c-kPlus>   :clast<CR>
        nnoremap <c-kMinus>  :cfirst<CR>
        nnoremap <m-kPlus>   :cnewer<CR>
        nnoremap <m-kMinus>  :colder<CR>
    endif
    " }

    " Close the current buffer without closing the window {
        map <leader>bd :Bclose<cr>

        command! Bclose call <SID>BufcloseCloseIt()
        function! <SID>BufcloseCloseIt()
            let l:currentBufNum = bufnr("%")
            let l:alternateBufNum = bufnr("#")

            if buflisted(l:alternateBufNum)
                buffer #
            else
                bnext
            endif

           if bufnr("%") == l:currentBufNum
             new
           endif

           if buflisted(l:currentBufNum)
             execute("bdelete! ".l:currentBufNum)
           endif
        endfunction
    " }

" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }
" 

" Plugins {
    " Syntastic {
        let g:syntastic_python_checkers = ['pep8']
        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
    "}

    " Javascript-Syntax {
        au FileType javascript call JavaScriptFold()
    "}

    " vim-session {
    	let g:session_autosave = 'no'
	let g:session_autoload = 'no'
    " }

    " YouCompleteMe {
    	let g:ycm_python_binary_path = '/usr/bin/python3'
    " }
" }

" Miscellaneous Key Mappings {
    " running external programs
    "open explorer in the current file's directory
    map \e :!start explorer "%:p:h"<CR>

    "open windows command prompt in the current file's directory
    map \c :!start cmd /k cd "%:p:h"<CR>

" }
