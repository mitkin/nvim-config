vim.o.swapfile = false

vim.bo.expandtab = true

-- Set your leader key to a preferred key (default is '\')
vim.g.mapleader = ','

-- Enable line numbers
vim.wo.number = true

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Highlight search results as you type
vim.o.incsearch = true

-- Enable mouse support
vim.o.mouse = 'a'

-- Set tab width to 4 spaces
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-- Enable clipboard support for copy/paste between Neovim and system clipboard
vim.o.clipboard = 'unnamedplus'

-- Use a dark color scheme (You can replace this with your preferred color scheme)
vim.cmd('colorscheme habamax')


-- Plugin management using Packer.nvim (You can use your preferred plugin manager)
-- Install Packer.nvim if you haven't already: https://github.com/wbthomason/packer.nvim
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.cmd('!git clone ' .. packer_url .. ' ~/.config/nvim/pack/packer/start/packer.nvim')
    vim.cmd('packadd packer.nvim')
end

-- Initialize Packer.nvim
require('packer').startup(function()
    -- Your plugins configuration here
    use 'github/copilot.vim'
    use 'neovim/nvim-lspconfig'  -- Example LSP configuration
    use 'hrsh7th/nvim-compe'     -- Autocompletion plugin
    use 'nvim-lua/popup.nvim'    -- Dependency for fzf.vim
    use 'nvim-lua/plenary.nvim'  -- Dependency for fzf.vim
    -- use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
    use 'tpope/vim-fugitive'     -- Git integration
    use 'airblade/vim-gitgutter' -- Git diff in the gutter
    use 'junegunn/fzf'           -- Fuzzy file search
    use 'junegunn/fzf.vim'       -- Fzf integration
    use 'tpope/vim-commentary'   -- Commenting
    -- Telescope.nvim for enhanced file search and interaction
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
    }
end)

-- Configure Pyright for Python LSP
local nvim_lsp = require('lspconfig')
nvim_lsp.pyright.setup{}

-- Configure gopls LSP for Go
nvim_lsp.gopls.setup {
    cmd = {"gopls", "-remote=auto"},
    on_attach = function(client)
    end,
}

nvim_lsp.ansiblels.setup{}

vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gD', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gR', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gA', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ge', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gq', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gn', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })


-- Configure Telescope.nvim
local telescope = require('telescope')
telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=always',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
        prompt_prefix = ' ',
        selection_caret = ' ',
        mappings = {
            i = {
                ["<Esc>"] = require('telescope.actions').close,
            },
        },
    },
}

-- Keybindings for Telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })
 

