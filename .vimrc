call pathogen#infect()

let mapleader = ' '

syntax enable
filetype plugin indent on

set tags+=gems.tags
set textwidth=80
let &colorcolumn=join(range(&textwidth + 1, &textwidth + 30),",")
set showbreak=++\
set mouse=a
set nocompatible
set ruler
set relativenumber
set ts=2
set sw=2
set expandtab
set wildmode=list:longest
set list listchars=tab:»\ ,trail:·
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
