nnoremap ; :
let mapleader = ' '

syntax on
filetype plugin indent on

set mouse=a
set nocompatible
set ruler
set relativenumber
set nowrap
set tabstop=4
set wildmode=list:longest
set list listchars=tab:»·,trail:·
set pastetoggle=<F2>
set t_Co=256 "256 colors
"set showtabline=2 "allways display tab bar
set ignorecase
set smartcase
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>h :w<cr>:b#<cr>
nnoremap <leader>j :w<cr>:bp<cr>
nnoremap <leader>k :w<cr>:bn<cr>
nnoremap <leader>k :w<cr>:b<cr>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap Q @q

colorscheme leo

autocmd Filetype eruby setlocal ts=2 sw=2 expandtab
autocmd Filetype haml setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype treetop setlocal ts=2 sw=2 expandtab

"https://github.com/tpope/vim-pathogen
call pathogen#infect()

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W

" Vim functions to run RSpec and Cucumber on the current file and optionally on
" the spec/scenario under the cursor.

function! RailsScriptIfExists(name)
" Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
" System Binary
  else
    return a:name
  end
endfunction

function! RunSpec(args)
  let spec = RailsScriptIfExists("bundle exec rspec --drb")
  let cmd = spec . " " . a:args . " -fn -c " . @%
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunCucumber(args)
  let cucumber = RailsScriptIfExists("cucumber")
  let cmd = cucumber . " " . @% . a:args
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile(args)
  if @% =~ "\.feature$"
    call RunCucumber("" . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("" . a:args)
  end
endfunction

function! RunTest(args)
  if @% =~ "\.feature$"
    call RunCucumber(":" . line('.') . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("-l " . line('.') . a:args)
  end
endfunction

map <Leader>; :call RunTest("")<CR>
map <Leader>' :call RunTestFile("")<CR>
