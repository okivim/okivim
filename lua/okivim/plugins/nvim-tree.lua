return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>z", "<cmd>NvimTreeToggle<cr>", desc = "Explorer (NvimTree)" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          relativenumber = false,
          number = false,
        },
        renderer = {
          group_empty = true,
          highlight_opened_files = "all",
        },
        filters = {
          dotfiles = false,
        },
        git = {
          ignore = false,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
      })
    end,
  },
}
