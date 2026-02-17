return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggle", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },
}
