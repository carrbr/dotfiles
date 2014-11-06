" self explanatory
:set background=dark

" turn on line numbering
:set number

" 'fixes' backspaces so that it works in a modern manner
:set backspace=indent,eol,start
set whichwrap+=<,>,h,l


" automatic indentation
:filetype indent on

" sets width for indents
:set tabstop=4

" also sets width for indentation
:set shiftwidth=4

" replaces tabs with spaces
:set expandtab

" turn off expandtab when editing make files (which require real tabs)
autocmd FileType make setlocal noexpandtab

""command W w !sudo tee % >/dev/null 
cmap w!! w !sudo tee >/dev/null %

" tells vim I'm running an ansi compliant terminal (for non-gvim)
" :set term=ansi

" turns on syntax highlighting
:syntax on

" following section borrowed from amix.dk/vim/vimrc.html
" BEGIN BORROWED SECTION

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" END BORROWED SECTION

" enable pathogen plugin
execute pathogen#infect()
 
" code below this line sets the colorscheme
if has("gui_running")
    colorscheme gotham
else
    colorscheme gotham256
endif

"                highlight ColorColumn ctermbg=7

"               highlight ColorColumn guibg=Gray

" endif
