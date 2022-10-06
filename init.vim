call plug#begin('~/.vim/plugged')

" leave some space in between
  Plug 'preservim/nerdtree'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'mangeshrex/everblush.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'prettier/vim-prettier'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <C-t> :NERDTreeToggle<CR>
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier'
  \ ]
set background=dark
set encoding=UTF-8
colorscheme tokyonight-night
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:everblushNR=1 " default
set laststatus=2
set showtabline=2
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
set updatetime=250
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
       \ 'active': {
       \   'left': [ ['mode', 'paste'],
       \             ['gitbranch', 'filename', 'modified'] ],
       \   'right': [ [ 'lineinfo' ], ['percent'] ]
       \ },
       \ 'component_function': {
       \    'gitbranch': 'GitBranch'
       \ },
       \ 'separator': { 'left': "\ue0b0",  'right': "\ue0b2" },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! GitBranch()
    let branch = FugitiveHead()
    return branch !=# '' ? "\ue0a0".branch : ''
endfunction

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198" >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next():
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

set colorcolumn=80
set relativenumber
set number
hi CursorLineNr guifg=#fff
set cursorline
set cursorlineopt=number

set expandtab
set ts=4
set shiftwidth=4
set smartindent

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
