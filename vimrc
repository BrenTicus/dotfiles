" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" General plugins
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline-themes'

"Language-specific plugins
Plug 'rust-lang/rust.vim'
Plug 'psf/black', { 'branch': 'stable' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Keystrokes! Yay!
nnoremap <C-o> :Explore<CR>
nnoremap <C-d> :ALEGoToDefinition<CR>
nnoremap <C-f> :ALEFindReferences<CR>
nnoremap <C-r> :ALERename<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-j> :Lines<CR>
nnoremap <Tab>   :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader>\ <C-w>w
nnoremap <Leader><CR> :vsplit<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader><Tab> gt

" fzf file previews.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Close the file browser when a file is opened.
" autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif

" Session management
au VimEnter * nested
\       if isdirectory(expand('%')) && filereadable('.session.vim')
\	|	if &filetype == 'netrw' | :bd | endif
\       |	execute 'source .session.vim'
\       | elseif isdirectory(expand('%'))
\       |	execute 'Obsess .session.vim'
\       | endif

" Other config
let mapleader="\\"
set number
set expandtab
set signcolumn=auto
set updatetime=100
set mouse=a
set mousemodel=popup_setpos
set completeopt=menu,menuone,preview,noselect,noinsert

" File Browser
let g:netrw_banner = 0

" Autocompletion/linting/etc
let g:ale_lint_on_text_changed=0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['ruff'],
\   'rust': ['rustfmt'],
\}
let g:ale_linters = {
\       'rust': ['analyzer'],
\       'python': ['pyright', 'ruff'],
\}
let g:rustfmt_autosave = 1
let g:ale_python_auto_poetry = 1

" Theming
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
colorscheme catppuccin-frappe
let g:airline_theme='base16_ashes'
