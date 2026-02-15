-- Set <Leader> key to Space.
-- This key is used as a prefix for custom key mappings.
vim.g.mapleader = " "

-- Disable netrw (built-in file explorer) to prevent conflicts with Oil.nvim.
-- Oil replaces netrw functionality, so we disable it to avoid unexpected behavior.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable inline diagnostic messages (virtual text).
-- This displays LSP errors and warnings directly at the end of the line.
vim.diagnostic.config({
  virtual_text = true,
})

-- If you need to debug LSP issues, you can enable logging here.
-- Keep in mind that the lsp.log file may grow very large if logging
-- is left enabled for extended periods of time.
vim.lsp.set_log_level(vim.log.levels.OFF)
