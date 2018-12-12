" ShaoZhengjiang's vimrc.

" Basic settings.
syntax on
set showcmd
set laststatus=1
set foldenable
set foldmethod=manual
set nocompatible
set number
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set fileformat=unix
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set cursorline
"set cc=120
set foldmethod=marker
set hlsearch

" Auto add head info
" .pl file into add header
function HeaderPerl()
    call setline(1, "#!/usr/bin/env perl -w")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(1, "use strict;")
    normal G
    normal o
endf
autocmd bufnewfile *.pl call HeaderPerl()


" Auto add head info
" .py file into add header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" .sh file
function HeaderBash()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins.
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'vim-syntastic/syntastic'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'rizzatti/dash.vim'

call vundle#end()
filetype plugin indent on

" Plugin nerdtree settings.
"map <F1> :NERDTreeToggle<CR>
"let NERDTreeChDirMode=1
"let NERDTreeShowBookmarks=1
"let NERDTreeWinSize=25
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.git$']

" Plugin tagbar settings.
map <F2> :TagbarToggle<CR> 

" Pluging ctrlp settings.
map <F3> :CtrlP<CR>

" Plugin ctrlsf settings.
"map <F4> :CtrlSF

" Plugin indentLine settings.
let g:indentLine_char = "︙"
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff=1

"" Plugin airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme="xtermlight"

" Plugin YCM settings.
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

" Plugin vim-bookmarks settings.
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE

" Plugin syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
" Use pylint to check python files.
let g:syntastic_python_checkers = ['pylint']
map <F6> :SyntasticToggleMode<CR> :SyntasticCheck<CR>

" Ignore warnings about newlines trailing.
let g:syntastic_quiet_messages = { 'regex': ['trailing-newlines', 'invalid-name',
    \'too-many-lines', 'too-many-instance-attributes', 'too-many-public-methods',
    \'too-many-locals', 'too-many-branches'] }

" Switch buffer
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>
" Tab navigation like Firefox.
nmap <C-w> :bnext<CR>

" comple dd
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
"        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
"        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
"        exec '!python %'
    elseif &filetype == 'perl'
        exec '!time perl %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 
