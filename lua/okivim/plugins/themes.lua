local specs = {}

local files = vim.api.nvim_get_runtime_file(
  "lua/okivim/appearance/themes/*.lua",
  true
)

for _, path in ipairs(files) do
  local mod = "okivim.appearance.themes." .. vim.fn.fnamemodify(path, ":t:r")
  local ok, theme = pcall(require, mod)
  if ok and theme.plugin then
    table.insert(specs, theme.plugin)
  end
end

return specs
