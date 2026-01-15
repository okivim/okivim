-- ------------------------------
-- Global Keymaps
-- ------------------------------
vim.g.mapleader = " " -- Set Space as the leader key

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>,,", "<C-^>", { desc = "Jump to alternate file (previous buffer)" })

vim.keymap.set("n", "<leader>,", vim.cmd.bfirst, { desc = "Go to first buffer" })
vim.keymap.set("n", "<leader>.", vim.cmd.blast, { desc = "Go to last buffer" })
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ls", vim.cmd.ls, { desc = "Show buffers list" })

vim.keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Insert an empty line below without leaving Normal mode" })
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete, { desc = "Close the current buffer" })

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select the entire file" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy current line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without overwriting clipboard" })

vim.keymap.set("v", "<", "<gv", { desc = "Reselect to continue identing the selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Reselect to continue identing the selection" })

vim.keymap.set("n", "<leader>dy", vim.diagnostic.open_float, { desc = "Show diagnostics under the cursor" })

vim.keymap.set("n", "<leader>f", "/", { desc = "Start forward search" })
-- Search navigation:
--   n     = next match
--   N     = previous match
--   <Esc> = exit search
--   :noh  = clear search highlight

-- ------------------------------
-- Telescope Keymaps
-- ------------------------------
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep (search text in project)" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List open buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })
