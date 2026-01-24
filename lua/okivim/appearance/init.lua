local M = {}

M.default = "catppuccin"

local state_file = vim.fn.stdpath("state") .. "/colorscheme.txt"

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

function M.get()
  return read_file(state_file) or M.default
end

function M.save(name)
  return write_file(state_file, name)
end

function M.apply(name)
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify(("Colorscheme not found: %s"):format(name), vim.log.levels.WARN)
    pcall(vim.cmd.colorscheme, "habamax")
    return false
  end
  return true
end

function M.apply_saved()
  local name = M.get()
  if not M.apply(name) then
    M.apply(M.default)
  end
end

return M
