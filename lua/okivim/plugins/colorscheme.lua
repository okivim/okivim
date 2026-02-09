local manager = require("okivim.colorscheme-manager")

manager.setup({
  colorscheme = "catppuccin",
})

return {
  { -- colorscheme = "catppuccin"
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha", -- mocha | macchiato | frappe | latte
    },
  },

  { -- colorscheme = "gruvbox"
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = true,
    opts = {
      contrast = "hard", -- hard | soft
    },
  },

  { -- colorscheme = "kanagawa"
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
    opts = {
      theme = "dragon", -- dragon | wave | lotus
    },
  },

  { -- colorscheme = "tokyonight"
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = true,
    opts = {
      style = "storm", -- storm | night | moon | day
    },
  },

  { -- colorscheme = "rose-pine" | "rose-pine-moon" | "rose-pine-dawn"
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = true,
  },

  { -- colorscheme = "nightfox" | "dayfox" | "dawnfox" | "duskfox" | "nordfox" | "terafox" | "carbonfox"
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = true,
    opts = {},
  },
}
