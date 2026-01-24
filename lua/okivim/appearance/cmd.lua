local theme = require("okivim.appearance")

local M = {}

local function discover()
  local files = vim.api.nvim_get_runtime_file("lua/okivim/appearance/themes/*.lua", true)
  table.sort(files)

  local names = {}
  for _, path in ipairs(files) do
    local name = vim.fn.fnamemodify(path, ":t:r")
    table.insert(names, name)
  end

  return names
end

local function refresh_ui()
  if package.loaded["lualine"] then
    pcall(require("lualine").refresh)
  end
end

function M.set(name)
  local names = discover()

  if not name or name == "" then
    vim.notify("Usage: :Theme <name>", vim.log.levels.INFO)
    vim.notify("Available: " .. table.concat(names, ", "), vim.log.levels.INFO)
    vim.notify("Current: " .. theme.get(), vim.log.levels.INFO)
    return
  end

  if not vim.tbl_contains(names, name) then
    vim.notify("Theme not registered: " .. name, vim.log.levels.ERROR)
    vim.notify("Available: " .. table.concat(names, ", "), vim.log.levels.INFO)
    return
  end

  if not theme.apply(name) then return end
  if not theme.save(name) then
    vim.notify("Failed to persist theme.", vim.log.levels.WARN)
    return
  end

  refresh_ui()
  vim.notify("Theme saved: " .. name, vim.log.levels.INFO)
end

function M.setup()
  vim.api.nvim_create_user_command("Theme", function(opts)
    M.set(opts.args)
  end, {
    nargs = "?",
    complete = function()
      return discover()
    end,
  })
end

return M
