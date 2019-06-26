" vim: sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell
"
" Adapted from
" https://github.com/Optixal/neovim-init.vim/blob/master/init.vim
"
" This file should be in the directory
" ~\AppData\Local\nvim
" or
" ~/.config/nvim
"
" $XDG_CONFIG_HOME/nvim/init.vim
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
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" See plugins for Python
" https://www.reddit.com/r/neovim/comments/98hyj9/async_plugins_for_neovim/

call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-fugitive' " integration with git
Plug 'junegunn/vim-easy-align'  " vim alignment: start with ga

Plug 'tpope/vim-surround'   " surround with parentheses, brackets, quotes, xml
Plug 'tpope/vim-unimpaired' " pairs of ops: previous/next, turn on/off
Plug 'tpope/vim-vinegar'    " improved shortcuts for netrw
Plug 'tpope/vim-repeat'     " improved repeate previous operations
Plug 'tpope/vim-rsi'        " readline keys in insert mode ctrl-a start of line

Plug 'plasticboy/vim-markdown' " better formatting for markdown

Plug 'mbbill/undotree'         " undo history visualizer

" gcc - comment out a line
" gcap - comment out a paragraph)
" gc in visual mode to comment out the selection
" :7,17Commentary - command a range
" :g/TODO/Commentary - comment using a global invocation
Plug 'tpope/vim-commentary'  " comment/uncomment stuff

Plug 'airblade/vim-gitgutter'         " display git status in gutter

" Uses https://github.com/palantir/python-language-server
" Create environment: conda create -n pyls python=3.7
" conda install -y 'python-language-server[all]'
" Install proselint for Markdown linter: pip install proselint
Plug 'w0rp/ale'

Plug 'vimoutliner/vimoutliner'

" requires fzf to be installed
" Plug 'C:/ProgramData/chocolatey/bin/fzf.exe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'markonm/traces.vim'

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

    set guifont=Consolas:h11
    " does not work use: nvim-qt --no-ext-tabline
    " set guitabline=0
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

" }

" Plugins {
    " Ale {
        " to customize proselint see https://github.com/amperser/proselint
        " On Windows/Mac/Linux
        " Modify file ~/.config/proselint/config and add settings
        " {
        "   "checks": {
        "     "typography.diacritical_marks": false,
        "     "typography.symbols": false
        "   }
        " }
        let g:ale_linters = {
        \   'python': ['pyls'],
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
        let g:ale_completion_enabled = 1
        set omnifunc=ale#completion#OmniFunc

        let g:ale_set_balloons = 1
        nnoremap <silent> <leader>af :ALEFix<CR>
        nnoremap <silent> <leader>at :ALEToggle<CR>
    " }

    " mbbill/undotree  {
        " Toggle Vim revision history
        nnoremap <silent> <leader>ut :UndotreeToggle<CR>
    " }

    " indentLine {
        nnoremap <silent> <leader>it :IndentLinesToggle<CR>
    " }

    " Pencil {
        nnoremap <silent> Q gqap
        xnoremap <silent> Q gq
        nnoremap <silent> <leader>Q vapJgqap
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
        " color schemes
        nnoremap <silent> <leader>fc :Colors<CR>
        " buffers
        nnoremap <silent> <leader>fb :Buffers<CR>
    " }

    " plasticboy/vim-markdown {
        let g:vim_markdown_folding_style_pythonic = 1
        let g:vim_markdown_conceal = 0
    " }

    " tagbar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " }

    " vim-easy-align {
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }

    " neoterm {
        " Use gy{text-object} in normal mode
        nmap gy <Plug>(neoterm-repl-send)

        " Send selected contents in visual mode.
        xmap gy <Plug>(neoterm-repl-send)

        " Send current line in normal mode
        nmap gyy <Plug>(neoterm-repl-send-line)
    " }

" Miscellaneous Key Mappings {
    " running external programs
    "open explorer in the current file's directory
    map <leader>oe :!start explorer "%:p:h"<CR>

    "open windows command prompt in the current file's directory
    map <leader>oc :!start cmd /k cd "%:p:h"<CR>

    " open vifm file manager in a terminal window
    map <leader>ov :term vifm<CR>

    " Change to directory of current file
    map <leader>cd :cd %:p:h<cr>

    " Pull word under cursor into LHS of a substitute
    nmap <leader>vz :%s#\<<c-r>=expand("<cword>")<cr>\>#
    " Pull Visually Highlighted text into LHS of a substitute
    vnoremap <leader>vz ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>
    " search for text
    map <leader>vg :vimgrep /\<<c-r>=expand("<cword>")<cr>\>/ **/*.<left><left><left><left><left><left><left>

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

    " map F3/C-F3/M-F3 to search for word under cursor
    " in current file or files with the same extension or all files
    map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj % " <Bar> cw<CR>
    map <C-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw<CR>
    map <M-F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*" <Bar> cw<CR>

    " redirect output of last :g// command to new window
    nmap <F4> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

    " See  src/gui/runtime/doc/nvim_gui_shim.txt in project https://github.com/equalsraf/neovim-qt
    " Toggle display of files in a tree view
    nmap <F5> :GuiTreeviewToggle<CR>

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
    if executable("rg")
        set grepprg=rg\ --vimgrep\ --no-heading
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif

" }
