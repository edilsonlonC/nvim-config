
"conf
" theme configuration
if (has("termguicolors"))
	set termguicolors
endif
set title "show name file in terminal
set number
set mouse=a

set cursorline
set colorcolumn=120
set relativenumber
set showcmd
"identar
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set noshowmode
set conceallevel=0
"terminal conf
set splitbelow
set splitright
set clipboard=unnamedplus
 " trigger `autoread` when files changes on disk
set autoread
set guifont=DroidSansMono\ Nerd\ Font\ 11

function! SplitAndClose()
  let current_file = expand('%:p')
  execute 'vsplit ' . current_file
  quit
endfunction

command! SplitClose call SplitAndClose()

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
			\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


filetype plugin on



