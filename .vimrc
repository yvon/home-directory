call pathogen#infect()
call pathogen#helptags()

let mapleader = ' '

syntax enable
filetype plugin indent on

set nowrap
set tags+=gems.tags
set textwidth=80
let &colorcolumn=join(range(&textwidth + 1, &textwidth + 30),",")
set cursorline
set showbreak=++\
set mouse=a
set nocompatible
set ruler
set relativenumber
set ts=2
set sw=2
set expandtab
set wildmode=list:longest
set list
set listchars=tab:»\ ,trail:·
set pastetoggle=<F2>
set t_Co=256 "256 colors
set ignorecase
set smartcase
set gdefault
set showmatch
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set guioptions=""
set guifont=Terminus\ 12

" nnoremap ; :
nnoremap Q @q
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :cn<CR>
nnoremap <F4> :cp<CR>
nnoremap <C-j> <C-W>w
nnoremap <C-k> <C-w>W

colorscheme leo
highlight ColorColumn guibg=#060606

autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType mail set tw=72
autocmd FileType txt set tw=72

au BufRead,BufNewFile Gemfile setfiletype ruby
au BufRead,BufNewFile Guardfile setfiletype ruby

function! RunSpec(line)
  let spec = "spin push"
  let cmd = spec . " " . @% . ":" . a:line
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile()
  call RunSpec("")
endfunction

function! RunTest()
  call RunSpec(line('.'))
endfunction

map <Leader>; :call RunTest()<CR>
map <Leader>' :call RunTestFile()<CR>
