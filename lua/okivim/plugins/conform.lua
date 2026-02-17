return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript      = { "prettierd", "prettier" },
          typescript      = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          json            = { "prettierd", "prettier" },
          scss            = { "stylelint", "prettierd", "prettier" },
          css             = { "stylelint", "prettierd", "prettier" },
          html            = { "prettierd", "prettier" },
          vue             = { "prettierd", "prettier" },
          rust            = { "rustfmt" },
          toml            = { "taplo" },
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
