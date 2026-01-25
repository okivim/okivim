return {
  name = "catppuccin-mocha",
  colorscheme = "catppuccin",
  background = "dark",
  plugin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  apply = function(t)
    require("catppuccin").setup({ flavour = "mocha" })
    vim.cmd.colorscheme(t.colorscheme)
    return true
  end,
}
