" folder plugins

call plug#begin('~/.local/share/nvim/plugged')
Plug 'wincent/command-t'
Plug 'tpope/vim-surround' " Description
Plug 'navarasu/onedark.nvim'
Plug 'scrooloose/nerdtree' " Files explorer
Plug 'dyng/ctrlsf.vim'
Plug 'joshdick/onedark.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'vim-airline/vim-airline-themes' " Themes
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'williamboman/mason.nvim'
Plug 'Yggdroot/indentLine'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neco-syntax'  " Fuen

Plug 'deoplete-plugins/deoplete-jedi'

Plug 'jiangmiao/auto-pairs'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'wokalski/autocomplete-flow'
  " For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'dense-analysis/ale'
Plug 'neovim/node-host' , {'do':'npm install -g neovim'}

"Plug 'ternjs/tern_for_vim',{'do':'npm install && npm install -g tern'}

"Plug 'carlitux/deoplete-ternjs'

Plug 'vimlab/split-term.vim'

Plug 'mg979/vim-visual-multi', {'branch':'master'}
"git
Plug 'tpope/vim-fugitive'

Plug 'ervandew/supertab'

Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'haya14busa/incsearch.vim'
"Javascript Plugins
"Plug 'w0rp/ale'

Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'mxw/vim-jsx'

Plug 'pangloss/vim-javascript'
"Plug 'leafoftree/vim-vue-plugin'
"
Plug 'preservim/nerdcommenter'

Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-jest'

Plug 'mfussenegger/nvim-dap'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'dyng/ctrlsf.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"test 

call plug#end()

