return {
  {
    "echasnovski/mini.starter",
    config = function()
      local starter = require("mini.starter")

      local header = {
        "",
        "              oooo         oooo               oooo                      ",
        "              oooo         oooo               oooo                      ",
        "              oooo                                                      ",
        "  ,oooooooo   oooo   -ooo  oooo oooo       oo oooo  ooooooooooooooooooo ",
        ".ooo'    ooo, oooo -ooo    oooo  oooo     oo  oooo  oooo    oooo    oooo",
        ":ooo-    oooo oooooooo*    oooo   oooo   oo   oooo  oooo    oooo    oooo",
        "`ooo,    ooo' oooo  oooo   oooo    oooo.oo    oooo  oooo    oooo    oooo",
        "   'oooooo'   oooo    oooo oooo     oooo'     oooo  oooo    oooo    oooo",
        "",
        "",
        "|> Simple and elegant",
        "",
      }

      starter.setup({
        header = table.concat(header, "\n"),

        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(5),
        },

        content_hooks = {
          starter.gen_hook.aligning("center"),
        },

        footer = "",
      })
    end,
  },
}
