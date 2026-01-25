local appearance = require("okivim.appearance")

local M = {}

local function discover()
  local files = vim.api.nvim_get_runtime_file("lua/okivim/appearance/themes/*.lua", true)
  table.sort(files)

  local themes = {}
  for _, path in ipairs(files) do
    local mod = "okivim.appearance.themes." .. vim.fn.fnamemodify(path, ":t:r")
    local ok, t = pcall(require, mod)
    if ok and type(t) == "table" and type(t.name) == "string" and type(t.colorscheme) == "string" then
      table.insert(themes, t)
    end
  end

  table.sort(themes, function(a, b)
    return a.name < b.name
  end)

  return themes
end

local function find_theme(themes, name)
  for _, t in ipairs(themes) do
    if t.name == name then
      return t
    end
  end
end

local function list_names(themes)
  local names = {}
  for _, t in ipairs(themes) do
    table.insert(names, t.name)
  end
  return names
end

local function refresh_ui()
  if package.loaded["lualine"] then
    pcall(require("lualine").refresh)
  end
end

function M.set(name)
  local themes = discover()
  local names = list_names(themes)

  if not name or name == "" then
    vim.notify("Usage: :Theme <name>", vim.log.levels.INFO)
    vim.notify("Available: " .. table.concat(names, ", "), vim.log.levels.INFO)
    vim.notify("Current: " .. appearance.get(), vim.log.levels.INFO)
    return
  end

  local t = find_theme(themes, name)
  if not t then
    vim.notify("Theme not registered: " .. name, vim.log.levels.ERROR)
    vim.notify("Available: " .. table.concat(names, ", "), vim.log.levels.INFO)
    return
  end

  if not appearance.apply(t) then return end
  if not appearance.save(t.name) then
    vim.notify("Failed to persist theme.", vim.log.levels.WARN)
    return
  end

  vim.schedule(refresh_ui)
  vim.notify("Theme saved: " .. t.name, vim.log.levels.INFO)
end

function M.setup()
  vim.api.nvim_create_user_command("Theme", function(opts)
    M.set(opts.args)
  end, {
    nargs = "?",
    complete = function()
      local themes = discover()
      return list_names(themes)
    end,
  })
end

return M
