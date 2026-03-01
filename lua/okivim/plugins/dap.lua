return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      "<F5>",
      "<F10>",
      "<F11>",
      "<F12>",
      "<leader>db",
      "<leader>dB",
      "<leader>dr",
      "<leader>dl",
    },
    dependencies = {
      { "rcarriga/nvim-dap-ui",           dependencies = { "nvim-neotest/nvim-nio" } },
      { "theHamsta/nvim-dap-virtual-text" },
      { "williamboman/mason.nvim" },
      { "jay-babu/mason-nvim-dap.nvim" },
      { "mxsdev/nvim-dap-vscode-js" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- =========================
      -- Mason
      -- =========================
      require("mason").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = {
          "debugpy",
          "codelldb",
          "js-debug-adapter",
          "php-debug-adapter",
        },
        automatic_installation = true,
      })

      -- =========================
      -- OPTIONAL ADAPTERS
      -- Uncomment adapter + configuration together
      -- and install with :MasonInstall <package>
      -- =========================

      ------------------------------------------------------------------
      -- JS / TS (js-debug-adapter)
      -- Install: :MasonInstall js-debug-adapter
      -- Requires: node in PATH
      ------------------------------------------------------------------

      -- require("dap-vscode-js").setup({
      --   debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
      --   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal" },
      -- })

      -- local function js_ts_configs()
      --   return {
      --     {
      --       type = "pwa-node",
      --       request = "launch",
      --       name = "TS/JS: Run current file (tsx)",
      --       cwd = "${workspaceFolder}",
      --       runtimeExecutable = "node",
      --       runtimeArgs = { "--loader", "tsx" },
      --       program = "${file}",
      --       sourceMaps = true,
      --       console = "integratedTerminal",
      --     },
      --   }
      -- end

      -- for _, lang in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      --   dap.configurations[lang] = js_ts_configs()
      -- end

      ------------------------------------------------------------------
      -- PHP (php-debug-adapter)
      -- Install: :MasonInstall php-debug-adapter
      -- Requires: node in PATH
      ------------------------------------------------------------------

      -- do
      --   local mason_root = vim.fn.stdpath("data") .. "/mason"
      --   local php_adapter = mason_root .. "/packages/php-debug-adapter/extension/out/phpDebug.js"
      --
      --   dap.adapters.php = {
      --     type = "executable",
      --     command = "node",
      --     args = { php_adapter },
      --   }
      -- end

      -- dap.configurations.php = {
      --   {
      --     type = "php",
      --     request = "launch",
      --     name = "PHP: Listen for Xdebug (9003)",
      --     port = 9003,
      --   },
      -- }

      ------------------------------------------------------------------
      -- Python (debugpy)
      -- Install: :MasonInstall debugpy
      ------------------------------------------------------------------

      -- do
      --   local mason_root = vim.fn.stdpath("data") .. "/mason"
      --   local python = mason_root .. "/packages/debugpy/venv/bin/python"
      --
      --   if vim.fn.has("win32") == 1 then
      --     python = mason_root .. "/packages/debugpy/venv/Scripts/python.exe"
      --   end
      --
      --   dap.adapters.python = {
      --     type = "executable",
      --     command = python,
      --     args = { "-m", "debugpy.adapter" },
      --   }
      -- end

      -- dap.configurations.python = {
      --   {
      --     type = "python",
      --     request = "launch",
      --     name = "Python: Launch current file",
      --     program = "${file}",
      --     cwd = "${workspaceFolder}",
      --   },
      -- }

      ------------------------------------------------------------------
      -- Rust (codelldb)
      -- Install: :MasonInstall codelldb
      ------------------------------------------------------------------

      -- do
      --   local mason_root = vim.fn.stdpath("data") .. "/mason"
      --   local codelldb = mason_root .. "/packages/codelldb/extension/adapter/codelldb"
      --
      --   if vim.fn.has("win32") == 1 then
      --     codelldb = codelldb .. ".exe"
      --   end
      --
      --   dap.adapters.codelldb = {
      --     type = "server",
      --     port = "${port}",
      --     executable = {
      --       command = codelldb,
      --       args = { "--port", "${port}" },
      --     },
      --   }
      -- end

      -- dap.configurations.rust = {
      --   {
      --     type = "codelldb",
      --     request = "launch",
      --     name = "Rust: Launch (target/debug/...)",
      --     cwd = "${workspaceFolder}",
      --     program = function()
      --       return vim.fn.input(
      --         "Path to executable: ",
      --         vim.fn.getcwd() .. "/target/debug/",
      --         "file"
      --       )
      --     end,
      --   },
      -- }

      -- =========================
      -- UI / SIGNS / KEYMAPS
      -- =========================

      require("nvim-dap-virtual-text").setup()
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticSignError",
      })

      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DiagnosticSignHint",
        linehl = "Visual",
      })

      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dr", dap.repl.open)
      vim.keymap.set("n", "<leader>dq", dap.terminate)
    end,
  },
}
