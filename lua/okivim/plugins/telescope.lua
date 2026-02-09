return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      "<leader><Space>",
      "<leader>ff",
      "<leader>fg",
      "<leader>fb",
      "<leader>fh",
      "<leader>fr",
      "<leader>fc",
      "<leader>ffh",
      "<leader>ffa",
      "<leader>ld",
      "<leader>lD",
      "<leader>li",
      "<leader>lr",
      "<leader>ls",
      "<leader>lS",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
          hidden = true,
        })
      end, { desc = "Find config files" })

      vim.keymap.set("n", "<leader>ffh", function()
        builtin.find_files({
          hidden = true,
        })
      end, {
        desc = "Find files + hidden",
      })

      vim.keymap.set("n", "<leader>ffa", function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
        })
      end, {
        desc = "Find all files",
      })
    end,
  },
}
