return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          --
          -- The following formatters are not installed by default
          -- You can install them using Mason (if available) or manually
          -- Install the ones you need :)
          --
          sh              = { "shfmt" },
          bash            = { "shfmt" },
          javascript      = { "prettierd", "prettier" },
          typescript      = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          json            = { "prettierd", "prettier" },
          scss            = { "stylelint", "prettierd", "prettier" },
          css             = { "stylelint", "prettierd", "prettier" },
          html            = { "prettierd", "prettier" },
          vue             = { "prettierd", "prettier" },
          dockerfile      = { "dockerfmt" },
          php             = { "pint" },
          python          = { "black" },
          rust            = { "rustfmt" },
          toml            = { "taplo" },
          --
          -- Add here any formatters you need
          -- For example: java = { "google-java-format" }
          --
          -- Filetype names must match Neovim's filetypes (e.g. "javascriptreact", "typescriptreact").
          -- You can check the current filetype with :set filetype?
          -- See :help filetype for more information.
        },

        format_on_save = {
          timeout_ms = 3000,
          lsp_fallback = true,
        },
      })
    end,
  },
}
