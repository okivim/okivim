return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "VeryLazy",
    config = function()
      require("fidget").setup({})
    end,
  },
}
