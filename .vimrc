set t_Co=256
set nocompatible
colorscheme leo
syntax enable
filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

let mapleader = ' '
let g:CommandTMaxFiles=50000

set hidden
set textwidth=80
set ts=2
set sw=2
set expandtab
set list
set listchars=nbsp:¬,tab:»\ ,trail:·
set wildmode=list:longest

set exrc
set mouse=a
set relativenumber

nnoremap ; :
nnoremap Q @q
nnoremap <C-j> <C-W>w
nnoremap <C-k> <C-w>W
nnoremap <leader>c :!ctags -R *<CR>
nnoremap <F3> :cn<CR>
nnoremap <F4> :cp<CR>

au BufRead,BufNewFile Gemfile setfiletype ruby
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile *.god setfiletype ruby

function! RunSpec(line)
  let arg = @%
  if a:line != ""
    let arg = arg . ":" . a:line
  end

  let cmd = "bundle exec spin push " . arg . " || bundle exec rspec --fail-fast " . arg
  execute ":! " . cmd
endfunction

function! RunCucumber(line)
  let cmd = "bundle exec cucumber " . @%
  if a:line != ""
    let cmd = cmd . ":" . a:line
  end
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile()
  if @% =~ "\.feature$"
    call RunCucumber("")
  elseif @% =~ "\.rb$"
    call RunSpec("")
  end
endfunction

function! RunTest()
  if @% =~ "\.feature$"
    call RunCucumber(line('.'))
  elseif @% =~ "\.rb$"
    call RunSpec(line('.'))
  end
endfunction

map <Leader>; :call RunTest()<CR>
map <Leader>' :call RunTestFile()<CR>
