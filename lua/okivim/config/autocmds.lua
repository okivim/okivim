-- ------------------------------
-- Global Auto cmd's
-- ------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local log = vim.fn.stdpath("data") .. "/conform.log"

    if vim.fn.filereadable(log) == 1 then
      vim.fn.delete(log)
    end
  end,
})
