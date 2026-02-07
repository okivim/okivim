return {
  {
    "echasnovski/mini.indentscope",
    version = "*",
    config = function()
      local indentscope = require("mini.indentscope")

      indentscope.setup({
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.quadratic({
            easing = "out",
            duration = 60,
            unit = "total",
          }),
        },
        symbol = "│",
        options = { try_as_border = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "dashboard",
          "lazy",
          "mason",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
