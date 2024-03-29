" vim: sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell

" Install VIM for Windows from https://tuxproject.de/projects/vim/
" Vim tips: https://github.com/mhinz/vim-galore
" More vim tips: https://github.com/jbranchaud/til
" Configuring VIM video: https://www.youtube.com/watch?v=Gs1VDYnS-Ac
" Learning VIM: https://www.youtube.com/watch?v=SZ-xHGD7sMc
" Configuring VIM for python: https://www.vimfromscratch.com/articles/vim-for-python/

" Uses vim-plug
" On Windows (PowerShell)
" md ~\vimfiles\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\vimfiles\autoload\plug.vim"
"   )
" )

" TODO: document chezmoi to setup vifmrc and tmux.conf: chezmoi cd; tree
" TODO: add comments for each plugin
" TODO: group related plugins
"
" To use scp on Windows need to change 3 lines to following 3 lines for netrw to work
" in the autload\netrw.vim file in the vim installation directory
"
"  if g:netrw_scp_cmd =~ '^scp' && (has("win32") || has("win95") || has("win64") || has("win16"))
"    let tmpfile_get = substitute(tr(tmpfile, '\', '/'), '^\(\a\):[/\\]\(.*\)$', '/\1/\2', '')
"   else
"
"  if g:netrw_scp_cmd =~ '^scp' && (has("win32") || has("win95") || has("win64") || has("win16")) && !has("gui_running")
"    let tmpfile_get = substitute(tr(tmpfile, '\', '/'), '^\(\a\):[/\\]\(.*\)$', '/\1/\2', '')
"   else
"
" extract lines from an otl file
" new | r !~/ws/vimrc/python/filter-indent.py # Standup

call plug#begin('~/.vim/plugged')

" Try the following plugins
" Plug 'tpope/vim-sleuth'  " auto sets expandtab - vim polyglot may be enough
" Plug 'dhruvasagar/vim-table-mode'  " create tables
" Plug 'AndrewRadev/splitjoin.vim'  " switch between single line/multi line

Plug 'tpope/vim-fugitive' " integration with git

Plug 'tpope/vim-sensible'   " sensible defaults for vim
Plug 'tpope/vim-surround'   " surround with parentheses, brackets, quotes, xml
Plug 'tpope/vim-unimpaired' " pairs of ops: previous/next, turn on/off
Plug 'tpope/vim-vinegar'    " improved shortcuts for netrw
Plug 'tpope/vim-repeat'     " improved repeat previous operations
Plug 'tpope/vim-rsi'        " readline keys in insert mode ctrl-a start of line

Plug 'thinca/vim-quickrun'  " run command line programs from VIM

" Better syntax highlighting with scripts loaded on demand
let g:polyglot_disabled = ['markdown']  " plasticboy/vim-markdown used instead
Plug 'sheerun/vim-polyglot'

Plug 'godlygeek/tabular'  " needed for vim-markdown
Plug 'plasticboy/vim-markdown' " better formatting for markdown

" display marks
Plug 'kshenoy/vim-signature', {'on': 'SignatureToggleSigns'}

" undo history visualizer
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" gcc - comment out a line
" gcap - comment out a paragraph)
" gc in visual mode to comment out the selection
" :7,17Commentary - comment a range
" :g/TODO/Commentary - comment using a global invocation
Plug 'tpope/vim-commentary'             " comment code gc in any language
Plug 'airblade/vim-gitgutter'           " display git status in gutter

" format for prose
Plug 'reedes/vim-pencil', {'on': 'PencilToggle'}

" document generator using \d
" :call doge#install()
Plug 'kkoomen/vim-doge'

" use vifm as a file picker
Plug 'vifm/vifm.vim', {'on': 'Vifm'}

" Uses https://github.com/palantir/python-language-server
" Create environment: conda create -n pyls python=3.8
" conda install -y 'python-language-server[all]'
" Install proselint for Markdown linter: pip install proselint
Plug 'dense-analysis/ale'

" viewer and finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}

Plug 'prabirshrestha/async.vim'  " needed for vim-lsp
Plug 'prabirshrestha/vim-lsp'  " vim language server protocol (lsp) support
Plug 'mattn/vim-lsp-settings'  " edit a supported language file ...
" then type :LspInstallServer

" Alternatives to ALE using language server protocol

Plug 'jlanzarotta/bufexplorer'        " display buffers in vim

" text objects and motions for Python classes, methods, functions, and doc strings

Plug 'michaeljsmith/vim-indent-object'  " indent text obj with ii, iI, ai, aI
Plug 'Yggdroot/indentLine'            " display vertical lines at indentation

Plug 'vimoutliner/vimoutliner', {'for': 'votl'}

" https://tomlankhorst.nl/iterm-tmux-vim-true-color/
" Plug 'flazz/vim-colorschemes'
" solarized8_high: high-contrast, solarized8: default Solarized,
" solarized8_low: low-contrast, solarized8_flat: flat
Plug 'lifepillar/vim-solarized8'

" vim reading mode
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}

Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}

" move to char, word, line with prompts, trigger <leader><leader>
Plug 'easymotion/vim-easymotion'
" Plug 'mg979/vim-visual-multi'  " multiple cursors

" Using the Tmux Plugin Manager (TPM) and modify ~/.tmux.conf
" set -g @plugin 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-navigator' " vim tmux navigator

Plug 'liuchengxu/vim-which-key'  " help for leader and localleader keys

" display tags of current buffer
" Needs ctags from https://github.com/universal-ctags/ctags
Plug 'majutsushi/tagbar'

" requires fzf to be installed
" Plug 'C:/ProgramData/chocolatey/bin/fzf.exe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" use \cs to find word under cursor; in insert mode type ctrl+x,u after word
Plug 'ron89/thesaurus_query.vim'

" highlights patterns and ranges for ex commands
Plug 'markonm/traces.vim'

" :Tmap python temp.py
" ,tt will then run the mapped command in the previous line
Plug 'kassio/neoterm'  " executes code in a REPL in the vim terminal

Plug 'xolox/vim-misc'          " works with vim session
" session management with vim
Plug 'xolox/vim-session', {'on': 'OpenSession'}

Plug 'vimwiki/vimwiki'

" gS to split and gJ to join
Plug 'AndrewRadev/splitjoin.vim'  " switch between single and multi-line formas of code

" Plug 'zerowidth/vim-copy-as-rtf'  " command CopyRTF to copy as syntax highlighted RTF on Macs

" Initialize plugin system
call plug#end()

" vim plugins https://github.com/akrawchyk/awesome-vim

" makes it easier to use mappings that use :map <leader>
let mapleader = "\<Space>"

" In the file vimfiles\bundle\vimoutliner\vimoutlinerc
" uncomment the following line for the comma comma keyboard mappings to work
let maplocalleader = ',,'

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ',,'<CR>

" use internal diff program
set diffexpr=

" convert Jupyter notebooks to Python files
" pip install jupytext flake8 autopep8 yapf  # Install libraries
" jupytext --to py data-analysis.ipynb  # Jupyter notebook to a python file

" Python formatting
" flake8 data-analysis.py  " Check the python file for pep8 issues
" autopep8 -i -a data-analysis.py  # Fix the python file
" set makeprg=flake8\ %  # Setup flake8 to go to the quickfix list
" type :make  to run the flake8 program
" type :clast to go to the last issue
" type :cpr to go the previous issue
" convert otl to md
" %s/\(\t\)\+/\0* /

" Editing Jupyter files in Python format
" Use \jp in vim for Jupytext mode and ]d/[d to go to the next/previous header

" Convert otl files to md to docx
" make sure all lines are indented one level deep or more
" convert otl to Google doc compatible indent
" %s/\(\t\)\+/\0* /
" convert otl to markdown for Confluence
" %s/^\t\(\S\)/### \1/
" pandoc file_name.md -o file_name.docx

" Terminal colors in vim
" Try :set termguicolors
" Try :set notermguicolors

" Basics {
    set nocompatible    " Use gVim defaults
    " source $VIMRUNTIME/vimrc_example.vim
    " source $VIMRUNTIME/mswin.vim
    " behave mswin
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/bash
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

    let g:airline_theme='solarized8'
    if has('gui_running')
        colorscheme solarized8_high
        set cursorline                  " Highlight current line
        autocmd VimEnter * colorscheme solarized8_high | highlight clear SignColumn
    else
        " colorscheme xterm16
        let g:solarized_termcolors=256
        colorscheme solarized8_high
        set nocursorline
    endif

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    " highlight clear LineNr          " Current line number row will have same background color in relative mode.
                                    " Things like vim-gitgutter will match LineNr highlight
    " highlight clear CursorLineNr    " Remove highlight color from current line number

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
    set nonumber                      " Line numbers on
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
    set nolist
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
        " brew install homebrew/cask-fonts/font-hack
        elseif has("gui_macvim")
            set guifont=Hack\ Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Hack\ Regular:h11,Consolas:h11,Courier_New:h11
        endif
    else
        if &term == 'xterm' || &term == 'screen' || &term == 'ansi'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
            " set t_Co=16              " Use only 16 colors to make it easier to see
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Key Mappings {

    set winaltkeys=yes  " allows the Alt+Space menu to work on Windows

   " resize horizontal split window
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

    map <leader>r :redraw!<cr>

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    "
    " cnoremap %% <C-R>=expand('%:h').'/'<cr>
    " map <leader>ew :e %%
    " map <leader>es :sp %%
    " map <leader>ev :vsp %%
    " map <leader>et :tabe %%

    " open netrw to current file dir
    nnoremap <silent> <leader>ee :Explore<CR>
    " split netrw horizontal
    nnoremap <silent> <leader>es :Sexplore<CR>
    " split netrw vertical
    nnoremap <silent> <leader>ev :Vexplore<CR>
    " split netrw tab
    nnoremap <silent> <leader>et :Texplore<CR>
    " restore netrw
    nnoremap <silent> <leader>er :Rexplore<CR>
    " left explorer toggle
    nnoremap <silent> <leader>el :Lexplore!<CR>

    " Map <Leader>tt to display all lines with keyword under cursor
    " and ask which one to jump to
    " nmap <Leader>zt [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
    nmap <Leader>zt [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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

    " Open URI in browser {
    " https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
    function! HandleURL()
      let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()]*')
      let s:uri = shellescape(s:uri, 1)
      echom s:uri
      if s:uri != ""
        silent exec "!open '".s:uri."'"
        :redraw!
      else
        echo "No URI found in line."
      endif
    endfunction

    nnoremap <leader>gx :call HandleURL()<CR>
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

    command! StripTrailingWhitespace call StripTrailingWhitespace()

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

    " functions for python jupyter format
    " From 'plasticboy/vim-markdown' plugin
    "
    " Matches any header level of any type.
    "
    let s:headersRegexp = '\v^# (#|.+\n(\=+|-+)$)'

    " Returns the line number of the first header before `line`, called the
    " current header.
    "
    " If there is no current header, return `0`.
    "
    " @param a:1 The line to look the header of. Default value: `getpos('.')`.
    "
    function! s:GetHeaderLineNum(...)
        if a:0 == 0
            let l:l = line('.')
        else
            let l:l = a:1
        endif
        while(l:l > 0)
            if join(getline(l:l, l:l + 1), "\n") =~ s:headersRegexp
                return l:l
            endif
            let l:l -= 1
        endwhile
        return 0
    endfunction

    " Move cursor to next header of any level.
    "
    " If there are no more headers, print a warning.
    "
    function! MoveToNextHeader()
        if search(s:headersRegexp, 'W') == 0
            "normal! G
            echo 'no next header'
        endif
    endfunction

    " Move cursor to previous header (before current) of any level.
    "
    " If it does not exist, print a warning.
    "
    function! MoveToPreviousHeader()
        let l:curHeaderLineNumber = s:GetHeaderLineNum()
        let l:noPreviousHeader = 0
        if l:curHeaderLineNumber <= 1
            let l:noPreviousHeader = 1
        else
            let l:previousHeaderLineNumber = s:GetHeaderLineNum(l:curHeaderLineNumber - 1)
            if l:previousHeaderLineNumber == 0
                let l:noPreviousHeader = 1
            else
                call cursor(l:previousHeaderLineNumber, 1)
            endif
        endif
        if l:noPreviousHeader
            echo 'no previous header'
        endif
    endfunction

    function! GetPyMarkdownFold(lnum)
        let l1 = getline(a:lnum)
        let l2 = getline(a:lnum+1)

        "if we're on a non-code line starting with a pound sign
        if l1 =~ '^# #'
            " set the fold level to the number of hashes -1
            " return '>'.(matchend(l1, '^#\+') - 1)
            " set the fold level to the number of hashes
            return '>'.(matchend(l1, '^# #\+') - 3)
        else
            " keep previous foldlevel
            return '='
        endif
    endfunction

    function! GetPyMarkdownFoldText()
        let line = getline(v:foldstart)
        let has_numbers = &number || &relativenumber
        let nucolwidth = &fdc + has_numbers * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 6
        let foldedlinecount = v:foldend - v:foldstart
        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let line = substitute(line, '\%("""\|''''''\)', '', '')
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount) + 1
        return line . ' ' . repeat("-", fillcharcount) . ' ' . foldedlinecount
    endfunction

	function! HighlightMarkdownHeadings()
        " set highlighting for markdown cell headings in python files
        autocmd FileType python highlight link markdownHeadings pythonTodo
        autocmd FileType python match markdownHeadings /\v# #+ .*/
	endfunction

    function! SetPyPercentOptions()
        setlocal foldmethod=expr
        setlocal foldexpr=GetPyMarkdownFold(v:lnum)
        setlocal foldtext=GetPyMarkdownFoldText()

        nmap ]d :call MoveToNextHeader()<CR>
        nmap [d :call MoveToPreviousHeader()<CR>

        call HighlightMarkdownHeadings()
    endfunction

    " function is not used
    function! GetPyPercentFold(lnum)
        " folding for the py:percent format for jupyter notebooks
        if getline(a:lnum) =~? '\m^# %%'  " cell line
            return '0'
        elseif getline(a:lnum) =~? '\v^\s*$'  " blank line
            return '-1'
        else
            return indent(a:lnum) / &shiftwidth + 1
        endif
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }
" }

" Plugins {

    " Ale {
        " to customize proselint see https://github.com/amperser/proselint
        " On Windows/Linux/Mac
        " Modify file ~/.config/proselint/config with settings such as:
        " {
        "   "checks": {
        "     "typography.diacritical_marks": false,
        "     "typography.symbols": false
        "   }
        " }
        let g:ale_linters = {
        \   'python': ['flake8'],
        \   'markdown': ['proselint']
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
        let g:ale_completion_enabled = 0

        let g:ale_set_balloons = 1
        nnoremap <silent> <leader>af :ALEFix<CR>
        nnoremap <silent> <leader>at :ALEToggle<CR>
        nnoremap <silent> <leader>an :ALENext<cr>
        nnoremap <silent> <leader>ap :ALEPrevious<cr>
    " }

    " vista {
        " https://github.com/liuchengxu/vista.vim
        " open sidebar to view symbols and tags
        nnoremap <silent> <leader>vv :Vista vim_lsp<cr>
        " open fzf to view symbols and tags
        nnoremap <silent> <leader>vf :Vista finder fzf:vim_lsp<cr>
        " close vista window
        nnoremap <silent> <leader>vc :Vista!<cr>
    " }

    " vim-lsp {
        " https://github.com/prabirshrestha/vim-lsp
        set omnifunc=lsp#complete

        set foldmethod=expr
          \ foldexpr=lsp#ui#vim#folding#foldexpr()
          \ foldtext=lsp#ui#vim#folding#foldtext()

        let g:lsp_log_verbose = 1
        let g:lsp_log_file = expand('~/vim-lsp.log')

        nnoremap <silent> <leader>la :LspCodeAction<cr>
        " nnoremap <silent> <leader>l? :LspDeclaration<cr>  " not for Python
        nnoremap <silent> <leader>ld :LspDefinition<cr>
        nnoremap <silent> <leader>lt :LspDocumentDiagnostics<cr>
        " nnoremap <silent> <leader>l? :LspDocumentFold<cr>  " not needed
        " nnoremap <silent> <leader>l? :LspDocumentFoldSync<cr>  " not sure functionality
        nnoremap <silent> <leader>lf :LspDocumentFormat<cr>
        " nnoremap <silent> <leader>l? :LspDocumentFormatSync<cr>  " not sure functionality
        nnoremap <silent> <leader>lm :LspDocumentRangeFormat<cr>
        " nnoremap <silent> <leader>l? :LspDocumentRangeFormatSync<cr>  " not sure functionality
        nnoremap <silent> <leader>ls :LspDocumentSymbol<cr>
        nnoremap <silent> <leader>lh :LspHover<cr>
        " nnoremap <silent> <leader>l? :LspImplementation<cr>  " not for Python
        nnoremap <silent> <leader>le :LspNextError<cr>  " vim issues
        " nnoremap <silent> <leader>l? :LspNextReference<cr>   " vim issues
        nnoremap <silent> <leader>lw :LspNextWarning<cr>
        " nnoremap <silent> <leader>l? :LspPeekDeclaration<cr>  " not for Python
        nnoremap <silent> <leader>lp :LspPeekDefinition<cr>
        " nnoremap <silent> <leader>l? :LspPeekTypeDefinition<cr>  " not for Python
        nnoremap <silent> <leader>lE :LspPreviousError<cr>  " vim issues
        " nnoremap <silent> <leader>l? :LspPreviousReference<cr>  " vim issues
        nnoremap <silent> <leader>lW :LspPreviousWarning<cr>
        nnoremap <silent> <leader>lr :LspReferences<cr>
        nnoremap <silent> <leader>ln :LspRename<cr>
        " nnoremap <silent> <leader>ll :LspStatus<cr>
        nnoremap <silent> <leader>lx :LspStopServer<cr>
        " nnoremap <silent> <leader>l? :LspTypeDefinition<cr>  " not for Python
        " nnoremap <silent> <leader>l? :LspWorkspaceSymbol<cr>  " not for Python
    " }

    " reedes/vim-pencil {
        nnoremap <silent> <leader>po :PencilOff<CR>
        nnoremap <silent> <leader>pt :PencilToggle<CR>
        nnoremap <silent> <leader>ph :PencilHard<CR>
        nnoremap <silent> <leader>ps :PencilSoft<CR>
    " }
    "
    " jupytext {
        nnoremap <silent> <leader>jp :call SetPyPercentOptions()<CR>
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>

        " very slow
        " nnoremap <silent> <leader>gl :0Glog<CR>

        " <leader>gp used to select last pasted text
        " nnoremap <silent> <leader>gp :Git push<CR>

        nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
    " }

    " FZF {
        let g:fzf_command_prefix = 'Fzf'

		" Empty value to disable preview window altogether
		let g:fzf_preview_window = ''

		" Always enable preview window on the right with 60% width
		" let g:fzf_preview_window = 'right:60%'

        " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
        let g:fzf_layout = { 'window': 'enew' }

        " type Rg pattern to search (will be replaced by command FzfRg)
        fun! SetupCommandAlias(from, to)
            exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
        endfun
        call SetupCommandAlias("Rg", "FzfRg")

        " list files in all sub directories
        nnoremap <silent> <leader>ff :FzfFiles<CR>
        " git status
        nnoremap <silent> <leader>fg :FzfGFiles?<CR>
        " lines in loaded buffers
        nnoremap <silent> <leader>fl :FzfLines<CR>
        " lines in current buffer
        nnoremap <silent> <leader>fa :FzfBLines<CR>
        " tags in the project
        nnoremap <silent> <leader>ft :FzfTags<CR>
        " marks
        nnoremap <silent> <leader>fm :FzfMarks<CR>
        " oldfiles and open buffers
        nnoremap <silent> <leader>fh :FzfHistory<CR>
        " snippets works with Ultisnips
        nnoremap <silent> <leader>fs :FzfSnippets<CR>
        " git status
        nnoremap <silent> <leader>fg :FzfGFiles?<CR>
        " git commits
        nnoremap <silent> <leader>fc :FzfCommits<CR>
        " git commits for current buffer
        nnoremap <silent> <leader>fb :FzfBCommits<CR>
        " color schemes FzfColors
        " nnoremap <silent> <leader>fc :Colors<CR>
        " buffers
        " nnoremap <silent> <leader>fb :Buffers<CR>

    " }

    " jlanzarotta/bufexplorer {
        nnoremap <silent> <leader>bb :buffers<CR>
        nnoremap <leader>ba :badd *
    " }

    " plasticboy/vim-markdown {
        let g:vim_markdown_folding_style_pythonic = 1
        " let g:vim_markdown_conceal = 0
        " let g:vim_markdown_conceal_code_blocks = 0
        let g:vim_markdown_frontmatter = 1
        let g:vim_markdown_conceal = 1
        let g:vim_markdown_no_default_key_mappings = 1
        nnoremap [oe :setlocal conceallevel=<c-r>=&conceallevel > 0 ? &conceallevel - 1 : 0<cr><cr>
        nnoremap ]oe :setlocal conceallevel=<c-r>=&conceallevel < 2 ? &conceallevel + 1 : 2<cr><cr>

        map ]] <Plug>Markdown_MoveToNextHeader
        map [[ <Plug>Markdown_MoveToPreviousHeader
        map [] <Plug>Markdown_MoveToPreviousSiblingHeader
        map ][ <Plug>Markdown_MoveToNextSiblingHeader

        " map ]u <Plug>Markdown_MoveToParentHeader
        " map ]c <Plug>Markdown_MoveToCurHeader
    " }

    " vim-easy-align {
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }

    " neoterm {

        let g:neoterm_repl_command="/bin/bash"
        " let g:neoterm_repl_command="C:/Program Files/Git/usr/bin/bash.exe"
        " let g:neoterm_repl_python="ipython"
        let g:neoterm_direct_open_repl=0
        " Use gy{text-object} in normal mode
        nmap gy <Plug>(neoterm-repl-send)

        " Send selected contents in visual mode.
        xmap gy <Plug>(neoterm-repl-send)

        " Send current line in normal mode
        nmap gyy <Plug>(neoterm-repl-send-line)
    " }

    " compare mappings starting with <leader>t with vim-test below

    " airblade/vim-gitgutter {
        " toggle gitgutter display
        nnoremap <silent> <leader>tg :GitGutterToggle<CR>
        nmap ]h <Plug>(GitGutterNextHunk)
        nmap [h <Plug>(GitGutterPrevHunk)
    " }

    " junegunn/goyo.vim {
        " toggle Goyo for distraction free writing
        nnoremap <silent> <leader>ty :Goyo<CR>
    " }

    " Yggdroot/indentLine {
        nnoremap <silent> <leader>ti :IndentLinesToggle<CR>
    " }

    " majutsushi/tagbar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " }

    " mbbill/undotree {
        nnoremap <silent> <leader>tu :UndotreeToggle<CR>
    " }

    " kshenoy/vim-signature {
        " toggle marks
        nnoremap <silent> <leader>tm :SignatureToggleSigns<CR>
    " }

    " xolox/vim-session {
        let g:session_autoload = 'no'
        let g:session_autosave = 'yes'
    " }

    " sheerun/vim-polyglot {
        " better syntax highlighting, folding and indentation for Python
        let g:python_highlight_all = 1
    " }

    " vimwiki/vimwiki {
        let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_global_ext = 0  " do not consider every markdown file a wiki file
    " }

    " vimoutliner/vimoutliner {
        autocmd BufNewFile,BufRead *.otl set syntax=votl
    " }
" }

" Miscellaneous Key Mappings {
    " paste in terminal mode
    tmap <S-Insert> <C-W>"+

    " mappings to format a paragraph in text format
    nnoremap <silent> Q gqap
    xnoremap <silent> Q gq
    nnoremap <silent> <leader>Q vapJgqap

    " Change to directory of current file
    map <leader>cd :cd %:p:h<cr>

    " Pull word under cursor into LHS of a substitute
    nmap <leader>zz :%s#\<<c-r>=expand("<cword>")<cr>\>#
    " Pull Visually Highlighted text into LHS of a substitute
    vnoremap <leader>zz ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

    " search for text
    map <leader>zg :vimgrep /\<<c-r>=expand("<cword>")<cr>\>/ **/*.<left><left><left><left><left><left><left>

    " toggle background between dark and light
    if exists("*ToggleBackground") == 0
        function ToggleBackground()
            if &background == "dark"
                set background=light
            else
                set background=dark
            endif
        endfunction

        command TB call ToggleBackground()
    endif

    " toggle background between dark and light
    map <leader>zb :call ToggleBackground()<cr>

    " choose solarized8 colorschemes
    map <leader>z1 :colorscheme solarized8<cr>
    map <leader>z2 :colorscheme solarized8_flat<cr>
    map <leader>z3 :colorscheme solarized8_low<cr>
    map <leader>z4 :colorscheme solarized8_high<cr>

    " copy full path of current buffer to the clipboard
    map <leader>cp :let @* = expand("%:p")<CR>

    " command to select last pasted text
    nnoremap <expr> <leader>gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " Close the current buffer without closing the window {
        " may be able to do this without a function
        " https://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
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

    " map F3/C-F3/M-F3 to search for word under cursor
    " in current file or files with the same extension or all files
    map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj % " <Bar> cw<CR>
    map <C-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw<CR>
    map <M-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*" <Bar> cw<CR>

    " redirect output of last :g// command to new window
    nmap <F4> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

    " search & send output to a new buffer. Example :Filter red\|blue
    command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

    " redirect external command to a new buffer (# is the current file)
    ":new | read !ls -la #

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
" }

" May not be needed {
    set modeline
    set modelines=5
    set encoding=utf-8
    set smartindent
    "set visualbell
    set ttyfast

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

    if executable("rg")
        set grepprg=rg\ --vimgrep\ --no-heading
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif

" }

" VIM tips {
    " To send the output of a command to a temporary buffer
    " https://stackoverflow.com/questions/25038687/vim-show-window-with-output-after-issuing-external-command
    " :new | read !ls ~/

    " To search in a selected range
    " use /\%Vsearchterm
    " https://stackoverflow.com/questions/3264120/
" }
