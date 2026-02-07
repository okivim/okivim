local function t() return require("trouble") end

return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        function() t().toggle("diagnostics") end,
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        function() t().toggle("diagnostics", { filter = { buf = 0 } }) end,
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        function() t().toggle("symbols", { focus = false }) end,
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        function() t().toggle("lsp", { focus = false, win = { position = "right" } }) end,
        desc = "LSP (Trouble)",
      },
      {
        "<leader>xL",
        function() t().toggle("loclist") end,
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        function() t().toggle("qflist") end,
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
