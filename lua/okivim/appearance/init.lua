local M = {}

M.default = "catppuccin-mocha"

local state_file = vim.fn.stdpath("state") .. "/theme.txt"

local function read_file(path)
  local f = io.open(path, "r")
  if not f then return nil end
  local s = f:read("*l")
  f:close()
  if s and s ~= "" then return s end
  return nil
end

local function write_file(path, text)
  local f = io.open(path, "w")
  if not f then return false end
  f:write(text)
  f:close()
  return true
end

local function discover()
  local files = vim.api.nvim_get_runtime_file("lua/okivim/appearance/themes/*.lua", true)
  table.sort(files)

  local themes = {}
  for _, path in ipairs(files) do
    local mod = "okivim.appearance.themes." .. vim.fn.fnamemodify(path, ":t:r")
    local ok, t = pcall(require, mod)
    if ok and type(t) == "table" and type(t.name) == "string" and type(t.colorscheme) == "string" then
      themes[t.name] = t
    end
  end

  return themes
end

function M.get()
  return read_file(state_file) or M.default
end

function M.save(name)
  return write_file(state_file, name)
end

function M.apply(theme)
  if theme.background == "dark" or theme.background == "light" then
    vim.o.background = theme.background
  end

  if type(theme.apply) == "function" then
    local ok, applied = pcall(theme.apply, theme)
    if ok and applied == true then
      return true
    end
  end

  local ok = pcall(vim.cmd.colorscheme, theme.colorscheme)
  if not ok then
    vim.notify(("Colorscheme not found: %s"):format(theme.colorscheme), vim.log.levels.WARN)
    pcall(vim.cmd.colorscheme, "habamax")
    return false
  end
  return true
end

function M.apply_saved()
  local name = M.get()
  local map = discover()

  local t = map[name] or map[M.default]
  if t then
    M.apply(t)
  else
    pcall(vim.cmd.colorscheme, "habamax")
  end
end

return M
