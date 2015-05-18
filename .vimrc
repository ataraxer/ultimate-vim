if filereadable(expand('~/.vimrc.bundle'))
  source ~/.vimrc.bundle
endif

syntax on

set cursorline   " highlight current line
set number       " show line numbers
set laststatus=2 " always show status line

set nocompatible
set backspace=indent,eol,start
set history=100
set ruler
set showcmd   " show
set showmatch " briefly jump to the matching bracket

set wrap
" set nowrap
set linebreak
set nolist

" update file if changed outside of vim but not inside
set autoread
set autoindent

" show search matches as you type
set nobackup
set incsearch

set directory=~/.vim/_temp

" ignore case unless mixed
set ignorecase smartcase

" highlight search
set hlsearch

" show 5 lines of context around cursor
set scrolloff=5
set sidescroll=12
set listchars+=precedes:<,extends:>
set list listchars=tab:→\ ,trail:·
set tabstop=4
set expandtab shiftwidth=2 softtabstop=2

set t_Co=256
set term=screen-256color

au BufRead,BufNewFile *.py set expandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.json set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.c set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.cc set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.cpp set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.h set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.gitconfig set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.sbt set syntax=scala
au BufRead,BufNewFile *.md set syntax=markdown wrap nolist
au BufRead,BufNewFile *.conf set syntax=ruby
au BufRead,BufNewFile *.snippets set noexpandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.hbs set syntax=html
au BufRead,BufNewFile *.java set expandtab shiftwidth=4 softtabstop=4

au FileType sh set noexpandtab shiftwidth=4 softtabstop=4
au FileType java :SyntasticToggleMode

hi ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" automatically make file executable
function MakeExecutable()
  if getline(1) =~ '^#!'
    if getline(1) =~ 'bin/'
      silent !chmod u+x <afile>
    endif
  endif
endfunction

au BufWritePost * call MakeExecutable()

" show syntax highlighting groups for word under cursor
function SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

nmap q :call SynStack()<CR>

" close buffer with \q
map <silent> <leader>q :q<CR>
" save file with \s
map <silent> <leader>s :w<CR>
" hide search highlighting with \h
map <silent> <leader>h :nohl<CR>
" easy fold
vmap <silent> <leader>f :fold<CR>

