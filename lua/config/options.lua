-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used

vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_prettier_needs_config = false
vim.g.lazyvim_php_lsp = "intelephense"
