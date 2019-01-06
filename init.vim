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
Plug 'airblade/vim-gitgutter'         " display git status in gutter

Plug 'junegunn/vim-easy-align'  " vim alignment: start with ga

Plug 'tpope/vim-surround'   " surround with parentheses, brackets, quotes, xml
Plug 'tpope/vim-unimpaired' " pairs of ops: previous/next, turn on/off
Plug 'tpope/vim-vinegar'    " improved shortcuts for netrw

Plug 'plasticboy/vim-markdown' " better formatting for markdown

" Install flake8 for Python linter: conda install flake8
" Install yapf for Python fixer: pip install yapf
Plug 'w0rp/ale'  " linter and formatter

Plug 'lifepillar/vim-solarized8'  " Optimized Solarized colorschemes

Plug 'vim-airline/vim-airline'        " fancy status bar
Plug 'vim-airline/vim-airline-themes' " themes for status bar

" Initialize plugin system
call plug#end()


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
        cmap <S-Insert> <C-R>+
    endif

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

" }
