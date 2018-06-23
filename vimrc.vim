" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell

" Install VIM for Windows from https://tuxproject.de/projects/vim/

" Uses vim-plug
" On Windows (PowerShell)
" md ~\AppData\Local\nvim\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\AppData\Local\nvim\autoload\plug.vim"
"   )
" )

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' " integration with git
Plug 'gregsexton/gitv'    " git repository viewer

Plug 'tpope/vim-sensible'   " sensible defaults for vim
Plug 'tpope/vim-surround'   " surround with parentheses, brackets, quotes, xml
Plug 'tpope/vim-unimpaired' " pairs of ops: previous/next, turn on/off
Plug 'tpope/vim-vinegar'    " improved shortcuts for netrw
Plug 'tpope/vim-repeat'     " improved repeate previous operations

Plug 'plasticboy/vim-markdown' " better formatting for markdown
Plug 'reedes/vim-pencil'       " editing text & markdown files

Plug 'kshenoy/vim-signature'   " display marks
Plug 'xolox/vim-misc'          " works with vim session
Plug 'xolox/vim-session'       " session management with vim
Plug 'mbbill/undotree'         " undo history visualizer

Plug 'scrooloose/nerdcommenter'       " add comments in any language
Plug 'vim-airline/vim-airline'        " fancy status bar
Plug 'vim-airline/vim-airline-themes' " themes for status bar
Plug 'airblade/vim-gitgutter'         " display git status in gutter

" VIM as Python IDE from http://liuchengxu.org/posts/use-vim-as-a-python-ide/
" Install flake8 for Python linter: conda install flake8
" Install yapf for Python fixer: pip install yapf
Plug 'w0rp/ale'
" Install isort to sort Python imports: conda install isort
" Type :Isort to sort Python imports
Plug 'fisadev/vim-isort'

Plug 'skywind3000/asyncrun.vim' " run processes asynchronously

Plug 'jlanzarotta/bufexplorer' " display buffers in vim
Plug 'yegappan/mru'            " most recently used file
Plug 'Raimondi/delimitMate'    " auto insert open close parens

Plug 'Yggdroot/indentLine'     " display vertical lines at indentation
Plug 'bronson/vim-trailing-whitespace' " hightlight trailing whitespace
"
Plug 'jelera/vim-javascript-syntax'
Plug 'vimoutliner/vimoutliner'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'

Plug 'maralla/completor.vim'
Plug 'davidhalter/jedi-vim'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" test the following plugins
"Plug 'benmills/vimux'
"Plug 'janko-m/vim-test'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'jtratner/vim-flavored-markdown'
"Plug 'junegunn/fzf.vim'
"Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-dispatch'
"Plug 'wesQ3/vim-windowswap'
"Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-commentary'
"Plug 'vim-scripts/grep.vim'
"Plug 'vim-scripts/CSApprox'  # gvim colorschemes in a terminal vim
"Plug 'sheerun/vim-polyglot'

" In the file vimfiles\bundle\vimoutliner\vimoutlinerc
" uncomment the following line for the comma comma keyboard mappings to work
" let maplocalleader = ',,'

" Initialize plugin system
call plug#end()

" use internal diff program
set diffexpr=

" Basics {
    set nocompatible    " Use gVim defaults
    " source $VIMRUNTIME/vimrc_example.vim
    " source $VIMRUNTIME/mswin.vim
    behave mswin
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/sh
    endif
" }

" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting

    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

    " may not be a good idea
    " set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set nospell                         " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile          " So is persistent undo ...
            set undolevels=1000   " Maximum number of changes that can be undone
            set undoreload=10000  " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Vim UI {
    syntax enable
    set background=dark

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode


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

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType python setlocal foldmethod=indent softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType python normal zR

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

    let g:airline_theme='solarized'
    if has('gui_running')
        colorscheme solarized
        set cursorline                  " Highlight current line
    else
        colorscheme default
        set nocursorline
    endif
" }

" Key Mappings {

    set winaltkeys=yes  " allows the Alt+Space menu to work on Windows

    nnoremap <c-j> <c-w><c-j>
    nnoremap <c-k> <c-w><c-k>
    nnoremap <c-l> <c-w><c-l>
    nnoremap <c-h> <c-w><c-h>

    " resize horzontal split window
    nmap <M-Up> <C-W>+
    nmap <M-Down> <C-W>-

    " resize vertical split window
    nmap <M-Right> <C-W>>
    nmap <M-Left> <C-W><

    " Increase/reduce font size
    nnoremap <C-Up> :silent! let &guifont = substitute(
    \ &guifont,
    \ ':h\zs\d\+',
    \ '\=eval(submatch(0)+1)',
    \ '')<CR>
    nnoremap <C-Down> :silent! let &guifont = substitute(
    \ &guifont,
    \ ':h\zs\d\+',
    \ '\=eval(submatch(0)-1)',
    \ '')<CR>

    " use v_Y command to yank text and keep cursor at the end of the selection
    vnoremap Y y'>

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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
" }

" Plugins {
    " Syntastic {
    "    let g:syntastic_python_checkers = ['pep8']
    "    let g:syntastic_javascript_checkers = ['jshint']
    "    let g:syntastic_always_populate_loc_list = 1
    "    let g:syntastic_check_on_open = 1
    "    let g:syntastic_check_on_wq = 0
    " }

    " Ale {
        let g:ale_linters = {
        \   'python': ['flake8']
        \}
        let g:ale_fixers = {
        \   'python': ['yapf']
        \}
        " fix files on save
        let g:ale_fix_on_save = 0
        " integrate with vim-airline
        let g:airline#extensions#ale#enabled = 1
        " use locallist instead of quickfix
        let g:ale_set_loclist = 1
        let g:ale_set_quickfix = 0

        nnoremap <silent> <leader>af :ALEFix<CR>
        nnoremap <silent> <leader>at :ALEToggle<CR>

        nmap <silent> <C-k> <Plug>(ale_previous_wrap)
        nmap <silent> <C-j> <Plug>(ale_next_wrap)
    " }

    " asyncrun {

        " Quick run via <F5>
        nnoremap <F5> :call <SID>compile_and_run()<CR>

        augroup SPACEVIM_ASYNCRUN
            autocmd!
            " Automatically open the quickfix window
            autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
        augroup END

        function! s:compile_and_run()
            exec 'w'
            if &filetype == 'c'
                exec "AsyncRun! gcc % -o %<; time ./%<"
            elseif &filetype == 'cpp'
               exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
            elseif &filetype == 'java'
               exec "AsyncRun! javac %; time java %<"
            elseif &filetype == 'sh'
               exec "AsyncRun! bash %"
            elseif &filetype == 'python'
               exec "AsyncRun! python %"
            endif
        endfunction

    " }

    " Jedi {
        let g:jedi#auto_initialization = 1
        let g:jedi#popup_on_dot = 0

        " Completion <C-Space>
        " Goto assignments <leader>g
        " Goto definitions <leader>d
        " Show Documentation/Pydoc K
        " Renaming <leader>r
        " Usages <leader>n
    " }

    " indentLine {
        noremap <F7> :IndentLinesToggle<CR>
    " }

    " completor {
        let g:completor_python_binary = '/C:/Users/gnoronha/AppData/Local/Continuum/miniconda3/python.exe'
    " }

    " Pencil {
        augroup pencil
        autocmd!
        autocmd FileType markdown,mkd call pencil#init()
        autocmd FileType text         call pencil#init()
        augroup END

        nnoremap <silent> Q gqap
        xnoremap <silent> Q gq
        nnoremap <silent> <leader>Q vapJgqap

        let g:airline_section_x = '%{PencilMode()}'

        noremap <F6> :PencilToggle<CR>
        noremap <C-F6> :PencilHard<CR>
        noremap <M-F6> :PencilSoft<CR>
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
    " }

    " gitv {
        nmap <leader>gv :Gitv --all<cr>
        nmap <leader>gV :Gitv! --all<cr>
        vmap <leader>gV :Gitv! --all<cr>
    " }

    " Javascript-Syntax {
        au FileType javascript call JavaScriptFold()
    " }

    " vim-session {
        let g:session_autosave = 'yes'
        let g:session_autoload = 'no'
    " }

    " YouCompleteMe {
        let g:ycm_python_binary_path = '/usr/bin/python3'
    " }

    " Markdown {
        let g:vim_markdown_folding_style_pythonic = 1
    " }

    " vim-easy-align {
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }
" }

" Miscellaneous Key Mappings {
    " running external programs
    "open explorer in the current file's directory
    map <leader>oe :!start explorer "%:p:h"<CR>

    "open windows command prompt in the current file's directory
    map <leader>oc :!start cmd /k cd "%:p:h"<CR>

    " Change to directory of current file
    map <leader>cd :cd %:p:h<cr>

    " Pull word under cursor into LHS of a substitute
    nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#
    " Pull Visually Highlighted text into LHS of a substitute
    vnoremap <leader>z ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>
    " search for text
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

    " copy full path of current buffer to the clipboard
    map <leader>cp :let @* = expand("%:p")<CR>

    " command to select last pasted text
    nnoremap <expr> <leader>gp '`[' . strpart(getregtype(), 0, 1) . '`]'

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

    " Plugin key mappings

    " Press F2 to toggle Vim revision history
   noremap <F2> :UndotreeToggle<CR>

    " map F3/C-F3/M-F3 to search for word under cursor
    " in current file or files with the same extension or all files
    map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj % " <Bar> cw<CR>
    map <C-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw<CR>
    map <M-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*" <Bar> cw<CR>

    " redirect output of last :g// command to new window
    nmap <F4> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

    " clear all signs placed by pymode checker, syntastic
    map <F12> :sign unplace *<cr>

    " Search in visual mode for current selection {
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

    function! VisualSearch(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
    " }
" }

" Terminal map for Windows {
    " active when running terminal in Vim

    " https://www.howtogeek.com/254401/34-useful-keyboard-shortcuts-for-the-windows-command-prompt/
    " https://gist.github.com/P7h/d5631d640ab91ed4a8e2e4732ff691d9

    " Command editing shortcuts
    " go to the start of the command line
    tnoremap <silent> <C-A> <Home>

    " go to the end of the command line
    tnoremap <silent> <C-E> <End>

    " delete from cursor to the end of the command line
    tnoremap <silent> <C-K> <C-End>

    " delete from cursor to the start of the command line
    tnoremap <silent> <C-U> <C-Home>

    " delete from cursor to start of word (does not work)
    " tnoremap <silent> <C-W> <C-BS>

    " move backward one word (does not work)
    " tnoremap <silent> <M-B> <C-Left>

    " move forward one word (does not work)
    " tnoremap <silent> <M-F> <C-Right>

    " delete to end of word starting at cursor (not supported)
    " tnoremap <silent> <A-D>

    " move forward one character
    tnoremap <silent> <C-F> <Right>

    " move backward one character
    tnoremap <silent> <C-B> <Left>

    " delete character under the cursor
    tnoremap <silent> <C-D> <Del>

    " delete character before the cursor
    tnoremap <silent> <C-H> <BS>

    " Command Recall Shortcuts
    " previous command in history
    tnoremap <silent> <C-P> <Up>
    " command in history
    tnoremap <silent> <C-N> <Down>

    " Command Control Shortcuts
    " clear the screen
    tnoremap <silent> <C-L> cls<Enter>

    " Command Recall Shortcuts
    " previous command in history
    tnoremap <silent> <C-P> <Up>

    " next command in history
    tnoremap <silent> <C-N> <Down>
" }

" May not be needed {
    set modeline
    set modelines=5
    set encoding=utf-8
    set smartindent
    "set visualbell
    set ttyfast
    set nonumber

    " handle long lines
    set textwidth=79
    set formatoptions=qrn1
    " highlight column 80 to display long lines
    set colorcolumn=80
    " remember window size and position
    set sessionoptions+=resize,winpos

    "make regex default
    nnoremap / /\v
    vnoremap / /\v

    " apply substitutions globally
    set gdefault
" }
