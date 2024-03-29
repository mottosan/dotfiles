" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'qpkorr/vim-bufkill'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-sleuth'
Plug 'simnalamburt/vim-mundo'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'godlygeek/Tabular'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'dstein64/vim-win'
Plug 'Chiel92/vim-autoformat'
Plug 'ruanyl/vim-gh-line'
call plug#end()
" }}}

" Colors {{{
syntax enable           " enable syntax processing
set background=light
colorscheme github
set termguicolors
" }}}

" Misc {{{
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
" }}}

" Spaces & Tabs {{{
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
"=== folding ===
"
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}

" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}

" Leader Shortcuts {{{
let mapleader=" "
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
nnoremap<leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
noremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
vnoremap <leader>y "+y
noremap <leader>/ :Commentary<cr>
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" }}}

" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$', '.scss$']
let g:syntastic_python_python_exec = 'python3'
" }}}

" AutoGroups {{{
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
  autocmd BufEnter *.py setlocal tabstop=4
  autocmd BufEnter *.md setlocal ft=markdown
  autocmd BufEnter *.js setlocal tabstop=2 shiftwidth=2
  autocmd BufEnter *.erb setlocal tabstop=2 shiftwidth=2
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd Filetype html setlocal ts=2 sw=2 expandtab
  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
augroup END
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" airline {{{
set laststatus=2
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

set t_Co=256
let g:airline_theme = "papercolor"
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" fzf stuff {{{
nnoremap <C-P> :<C-U>FuzzySilver<CR>
command! -bang FuzzySilver call fzf#run(fzf#wrap('ag-fzf', { 'source': 'ag --hidden --files-with-matches -g "" --ignore "\.git$"' }, <bang>0))
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = 'right:60%'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"

" long line warning
highlight ColorColumn ctermbg=gray
set colorcolumn=80

" other misc stuff
set tags=tags,./tags;
set splitbelow " cursor moves to new split window
set splitright " cursor moves to new split window
map <C-c> :BD<cr> " delete buffer without closing split
nnoremap <leader>v :vnew<CR>
nnoremap <leader>s :new<CR>
nnoremap <TAB>   :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

nnoremap <leader>u :MundoToggle<CR>

" when in tmux don't use unnamed clipboard
if $TMUX == ''
  set clipboard+=unnamed
endif

" if ag is installed use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-jsx
let g:vim_jsx_pretty_colorful_config = 1 " default 0

set shiftwidth=2
set autoindent
set smartindent

let g:gh_line_map = '<leader>gh'
let g:gh_line_blame_map = '<leader>gb'
