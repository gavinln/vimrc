" vim: sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell
"
" Adapted from
" https://github.com/Optixal/neovim-init.vim/blob/master/init.vim
"
" This file should be in the directory
" ~\AppData\Local\nvim
"
" Install neovim on Windows using Chocolatey
" https://github.com/neovim/neovim/wiki/Installing-Neovim
"
" Setup vim-plug on Windows as describe here
" https://github.com/junegunn/vim-plug
"
" md ~\AppData\Local\nvim\autoload
" $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" (New-Object Net.WebClient).DownloadFile(
"   $uri,
"   $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"     "~\AppData\Local\nvim\autoload\plug.vim"
"   )
" )
"
" See plugins for Python
" https://www.reddit.com/r/neovim/comments/98hyj9/async_plugins_for_neovim/

call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-fugitive' " integration with git
Plug 'gregsexton/gitv'    " git repository viewer

Plug 'junegunn/vim-easy-align'  " vim alignment: start with ga

Plug 'tpope/vim-surround'   " surround with parentheses, brackets, quotes, xml
Plug 'tpope/vim-unimpaired' " pairs of ops: previous/next, turn on/off
Plug 'tpope/vim-vinegar'    " improved shortcuts for netrw

Plug 'plasticboy/vim-markdown' " better formatting for markdown

Plug 'kshenoy/vim-signature'   " display marks
Plug 'xolox/vim-misc'          " works with vim session
Plug 'xolox/vim-session'       " session management with vim
Plug 'mbbill/undotree'         " undo history visualizer


Plug 'vim-airline/vim-airline'        " fancy status bar
Plug 'vim-airline/vim-airline-themes' " themes for status bar
Plug 'airblade/vim-gitgutter'         " display git status in gutter

" Install flake8 for Python linter: conda install flake8
" Install yapf for Python fixer: pip install yapf
Plug 'w0rp/ale'  " linter and formatter



Plug 'jlanzarotta/bufexplorer' " display buffers in vim
Plug 'yegappan/mru'            " most recently used file
Plug 'Raimondi/delimitMate'    " auto insert open close parenthesis

Plug 'Yggdroot/indentLine'     " display vertical lines at indentation
Plug 'bronson/vim-trailing-whitespace' " highlight trailing white-space

Plug 'vimoutliner/vimoutliner'

" pip install neovim
" pip install jedi
Plug 'davidhalter/jedi-vim'  " Python auto-completion
Plug 'maralla/completor.vim'  " Async completion framework

" display tags of current buffer
" Needs ctags from https://github.com/universal-ctags/ctags
Plug 'majutsushi/tagbar'

" requires fzf to be installed
" Plug 'C:/ProgramData/chocolatey/bin/fzf.exe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'lifepillar/vim-solarized8'  " Optimized Solarized colorschemes

Plug 'kassio/neoterm'  " send code to terminal REPL

" Initialize plugin system
call plug#end()

" In the file vimfiles\bundle\vimoutliner\vimoutlinerc
" uncomment the following line for the comma comma keyboard mappings to work
let maplocalleader = ',,'

" General settings {


    set background=dark
    colorscheme solarized8

    set hidden  " Allow buffer switching without saving
    set clipboard+=unnamedplus  " use system clipboard

" }

" GUI settings {

    set background=dark
    colorscheme solarized8

    set clipboard+=unnamedplus  " use system clipboard

" }

" Windows copy/cut/paste mappings {

    if has("clipboard")
        " SHIFT-Del is Cut
        vnoremap <S-Del> "+x

        " CTRL-Insert is Copy
        vnoremap <C-Insert> "+y

        " SHIFT-Insert is Paste
        map <S-Insert>  "+gP
        cmap <S-Insert>  <C-R>+
        imap <S-Insert>  <C-R>+
        vmap <S-Insert>  "_x"+gP
    endif

" }

" Window navigation mappings {

    noremap ;l  <C-W>l
    noremap ;h  <C-W>h
    noremap ;j  <C-W>j
    noremap ;k  <C-W>k
    noremap ;v  <C-W>v
    noremap ;s  <C-W>s

    noremap ;;  :

" }

" Plugin mappings {

    " vim-easy-align {
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
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
    " }

    " Markdown {
        let g:vim_markdown_folding_style_pythonic = 1
        let g:vim_markdown_conceal = 0
    " }

    " neoterm {
        " Use gx{text-object} in normal mode
        nmap gx <Plug>(neoterm-repl-send)

        " Send selected contents in visual mode.
        xmap gx <Plug>(neoterm-repl-send)

        " Send current line in normal mode
        nmap gxx <Plug>(neoterm-repl-send-line)
    " }

    " Jedi and completor {
        let g:jedi#auto_initialization = 1
        let g:jedi#popup_on_dot = 0

        " Completion <C-Space>
        " Goto assignments <leader>g
        " Goto definitions <leader>d
        " Show Documentation/Pydoc K
        " Renaming <leader>r
        " Usages <leader>n
    " }
    "
    " completor {
        let g:completor_python_binary = '/C:/Users/gavin/Miniconda3/python.exe'
        let g:completor_auto_trigger = 0
    " }


    " vim-session {
        let g:session_autosave = 'yes'
        let g:session_autoload = 'no'
        let g:session_menu = 0
    " }

    " MRU settings {
        let MRU_Add_Menu = 0
    " }

    " Miscellaneous Key Mappings {
        " running external programs
        "open explorer in the current file's directory
        map <leader>oe :!start explorer "%:p:h"<CR>

        "open windows command prompt in the current file's directory
        map <leader>oc :!start cmd /k cd "%:p:h"<CR>

        " Change to directory of current file
        map <leader>cd :cd %:p:h<cr>

        " command to select last pasted text
        nnoremap <expr> <leader>gp '`[' . strpart(getregtype(), 0, 1) . '`]'

        " Press F2 to toggle Vim revision history
        noremap <F2> :UndotreeToggle<CR>

        " toggle visibility of indent lines
        noremap <F7> :IndentLinesToggle<CR>

        nmap <F8> :TagbarToggle<CR>

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

    " FZF {
        " list files
        nnoremap <silent> <leader>ff :Files<CR>
        " git status
        nnoremap <silent> <leader>fg :GFiles?<CR>
        " lines in loaded buffers
        nnoremap <silent> <leader>fl :Lines<CR>
        " tags in the project
        nnoremap <silent> <leader>ft :Tags<CR>
        " marks
        nnoremap <silent> <leader>fm :Marks<CR>
        " oldfiles and open buffers
        nnoremap <silent> <leader>fh :History<CR>
        " snippets from Ultisnips
        nnoremap <silent> <leader>fs :Snippets<CR>
        " color schemes
        nnoremap <silent> <leader>fc :Colors<CR>
        " buffers
        nnoremap <silent> <leader>fb :Buffers<CR>
    " }

    " gitv {
        nmap <leader>gv :Gitv --all<cr>
        nmap <leader>gV :Gitv! --all<cr>
        vmap <leader>gV :Gitv! --all<cr>
    " }
    "
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

" }
