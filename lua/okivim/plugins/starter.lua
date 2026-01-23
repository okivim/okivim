return {
  {
    "echasnovski/mini.starter",
    config = function()
      local starter = require("mini.starter")

      local header = {
        "",
        "",
        "              88         88               88                     ",
        "              88                                                 ",
        "  ,adPPYba,   88   ,d8   88  8b       d8  88  88,dPYba,,adPYba,  ",
        " a8'     '8a  88 ,a8'    88  `8b     d8'  88  88P'   '88'    '8a ",
        " 8b       d8  8888[      88   `8b   d8'   88  88      88      88 ",
        " '8a,   ,a8'  88`'Yba,   88    `8b,d8'    88  88      88      88 ",
        "  `'YbbdP'`   88   `Y8a  88      '8'      88  88      88      88 ",
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
