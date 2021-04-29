" Source https://github.com/kaihendry/dotfiles/blob/master/.vimrc

syntax enable

map <F8> :setlocal spell! spelllang=en_gb<CR>
set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup

set encoding=utf-8

set diffopt+=iwhite " Ignore whitespace whilst diffing
nnoremap <silent> <F5> :%s/\s\+$//<cr>

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

set background=dark

set undofile
set undodir=/tmp

syntax on
filetype plugin indent on
set nofoldenable

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_highlight_debug = 1

nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" Go specific mapping
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au filetype go nmap <leader>t :w<CR>:GoTestFunc<CR>
au filetype go nmap <leader>T :w<CR>:GoTest<CR>
au filetype go nmap <leader>r :w<CR>:GoRun<CR>
au filetype go nmap <leader>b :GoDebugBreakpoint<CR>
au filetype go nmap <leader>d :GoDebugStart<CR>
au filetype go nmap <leader>s :GoDebugStop<CR>
au filetype go nmap <leader>n :GoDebugNext<CR>
au filetype go nmap <leader>c :GoDebugContinue<CR>
au FileType go nmap <F12> <Plug>(go-def)

"   let g:go_debug_mappings = {
"      \ '(go-debug-continue)':   {'key': '<F5>'},
"      \ '(go-debug-print)':      {'key': '<F6>'},
"      \ '(go-debug-breakpoint)': {'key': '<F9>'},
"      \ '(go-debug-next)':       {'key': '<F10>'},
"      \ '(go-debug-step)':       {'key': '<F11>'},
"      \ '(go-debug-halt)':       {'key': '<F8>'},
"   \ }

augroup GoDebug
  autocmd!
  au FileType go nmap <F12><F12> :GoDebugStop<CR>
  au FileType go nmap <F11> :GoDebugStep<CR>
  au FileType go nmap <F9> :GoDebugBreakpoint<CR>
augroup END

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

" https://youtu.be/PEm0QJ46hNo
inoremap <C-H> <C-W>

let g:indent_guides_enable_on_vim_startup = 1
