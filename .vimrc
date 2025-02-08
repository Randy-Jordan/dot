" GENERAL SETTINGS --------------------------------------------------------- {{{
colorscheme slate
set t_Co=256
set previewheight=7
set splitbelow
set nocompatible " Disable compatibility with vi which can cause unexpected issues.
filetype on " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on " Enable plugins and load plugin for the detected file type.
set filetype=txt " Set filetype to text if none specified.


set autochdir "ctags
set tags=./tags,tags; "ctags
filetype indent on " Load an indent file for the detected file type.
syntax on " Turn syntax highlighting on.
set foldmethod=syntax " Fold based on syntax
set scrolloff=5     " Keep at least 5 lines above/below cursor
set mouse=a         " Enable mouse usage in modes
set mousehide       " Hide the mouse when typing

set number " Add numbers to each line on the left-hand side.
set cursorline " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn " Highlight cursor line underneath the cursor vertically.
set nowrap " Do not wrap lines. Allow long lines to extend as far as the line goes.
set colorcolumn=80 " Highlight column for recommended size.

set shiftwidth=4 " Set shift width to 4 spaces.
set tabstop=4 " Set tab width to 4 columns.
set expandtab " Use space characters instead of tabs.


set incsearch " While searching though a file incrementally highlight matching characters as you type.
set ignorecase " Ignore capital letters during search.
set showmatch " Show matching words during a search.
set hlsearch " Use highlighting when doing a search.

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

set showcmd " Show partial command you type in the last line of the screen.
set showmode " Show the mode you are on the last line.

set history=1000 " Set the commands to save in history default number is 20.
set wildmenu " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set path+=** " Provides tab-completion for all file-related tasks

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" C-TAGS/DEFINITIONS ------------------------------------------------------- {{{
nnoremap <C-d> :ptag <c-r><C-w><CR>
nnoremap <C-c> :pclose<CR>
"}}}

" NETRW FILE TREE TOGGLE WITH CTRL-F --------------------------------------- {{{
"
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_winsize = 15
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Toggle Vexplore with Ctrl-F
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction

map <silent> <C-F> :call ToggleVExplorer()<cr>

function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright vnew' g:path
    :normal <C-l>
endfunction
" }}}

"TOGGLE TERMINAL WITH CTRL-T ----------------------------------------------- {{{
let mapleader=" "
let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
    if s:term_buf_nr == -1
        execute "botright terminal"
        let s:term_buf_nr = bufnr("$")
    else
        try
            execute "bdelete! " . s:term_buf_nr
        catch
            let s:term_buf_nr = -1
            call <SID>ToggleTerminal()
            return
        endtry
        let s:term_buf_nr = -1
    endif
endfunction

nnoremap <silent> <C-T> :call <SID>ToggleTerminal()<CR>
tnoremap <silent> <C-T> <C-w>N:call <SID>ToggleTerminal()<CR>

" }}}

"LIST BUFFERS WITH CTRL-B---------------------------------------------------{{{
nnoremap <C-b> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>  

"}}}

" GLOBAL COPY AND PASTE----------------------------------------------------------{{{
vmap<C-c> "+y
map <C-v> "+p
"}}}

"CODE SNIPPETS/TEMPLATES ---------------------------------------------------{{{

"Output Fold Section"
nnoremap <Leader>f i{{{--- FOLD SECTION ------------------------------------------------------------<CR>}}}<ESC>

"HTML SNIPPET/TEMPLATE"
nnoremap ,html :-1read $HOME/eg/web/index.html<CR>:11<CR>
if has("autocmd")
    augroup templates
        autocmd BufNewFile index.html 0r ~/eg/web/index.html
        autocmd BufReadPost index.html normal! 10j
    augroup END
endif

"CSS SNIPPET/TEMPLATE"
nnoremap ,css :-1read $HOME/eg/web/style.css<CR>
if has("autocmd")
    augroup templates
        autocmd BufNewFile style.css 0r ~/eg/web/style.css
    augroup END
endif

"README SNIPPET/TEMPLATE"
nnoremap ,read :-1read $HOME/eg/README.md<CR>
if has("autocmd")
    augroup templates
        autocmd BufNewFile README.md 0r ~/eg/README.md
    augroup END
endif
"}}}

" MINIMALIST TAB COMPLETE PLUGIN--------------------------------------------{{{
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
                \ && getline('.')[col('.') - 4] !~ '\K'
                \ && getline('.')[col('.') - 3] =~ '\K'
                \ && getline('.')[col('.') - 2] =~ '\K' " last char
                \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun
" }}}

" MINIMALIST CLOSING TAGS ------------------------------------------------- {{{
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" }}}

" FILE SETTINGS------------------------------------------------------------ {{{

" This will enable code folding.
" Use the marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup zshrc
    autocmd!
    autocmd FileType *.zshrc setlocal foldmethod=marker
augroup END


augroup txt
    autocmd!
    au BufEnter *.txt setlocal spell spelllang=en_us 
    au BufEnter *.txt setlocal wrap 
    au BufEnter *.txt setlocal textwidth=80 
augroup END

augroup md
    autocmd!
    au BufEnter *.md setlocal spell spelllang=en_us 
augroup END
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
highlight StatusLine   ctermfg=black  ctermbg=white cterm=bold
highlight StatusLineNC ctermfg=black ctermbg=darkgrey

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}
