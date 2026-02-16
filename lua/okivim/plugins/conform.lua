return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript      = { "prettier" },
          typescript      = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json            = { "prettier" },
          scss            = { "stylelint", "prettier" },
          css             = { "stylelint", "prettier" },
          html            = { "prettier" },
          vue             = { "prettier" },
          toml            = { "taplo" },
          rust            = { "rustfmt" },
        },

        formatters = {
          stylelint = {
            timeout_ms = 3000,
          },
        },

        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
        },
      })
    end,
  },
}
