" Make sure vim-plug is installed.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Basic config
let mapleader="\\"
set number
set hidden
set signcolumn=auto
set updatetime=100
set mouse=a
set mousemodel=popup_setpos
set completeopt=menu,menuone,preview,noselect,noinsert
set omnifunc=ale#completion#OmniFunc
filetype plugin on
syntax on
let g:netrw_browse = 0

" Autocompletion/linting/etc
let g:ale_lint_on_text_changed=0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'python': ['ruff'],
\	'rust': ['rustfmt'],
\}
let g:ale_linters = {
\	'rust': ['analyzer'],
\	'python': ['pyright', 'ruff'],
\}
let g:rustfmt_autosave = 1
let g:ale_python_auto_poetry = 1

" Theming
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" General plugins
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'qpkorr/vim-bufkill'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline-themes'

"Language-specific plugins
Plug 'rust-lang/rust.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Keystrokes! Yay!
nnoremap <C-n> :Lexplore<CR>
nnoremap <C-d> :ALEGoToDefinition<CR>
nnoremap <C-F> :Rg<CR>
nnoremap <C-r> :ALERename<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :Lines<CR>
nnoremap <Tab>   :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader>\ <C-w>w
nnoremap <Leader><CR> :vsplit<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader><Tab> gt
inoremap <C-p> <C-x><C-o>

" fzf/skim file previews and interactivity.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

" Session management
au VimEnter * nested
\       if isdirectory(expand('%')) && filereadable('.session.vim')
\       |	execute 'source .session.vim'
\	| 	:1bd
\       | elseif isdirectory(expand('%'))
\       |	execute 'Obsess .session.vim'
\       | endif

autocmd FileType netrw setl bufhidden=wipe

" Theming
colorscheme catppuccin-frappe
let g:airline_theme='base16_ashes'
