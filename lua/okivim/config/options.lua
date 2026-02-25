vim.opt.termguicolors = true                         -- Enable 24-bit colors
vim.opt.updatetime = 250                             -- Reduce refresh time (snappy)
vim.opt.ttimeoutlen = 0                              -- Key code timeout
vim.opt.autoread = true                              -- Auto-reload changes if outside of neovim
vim.opt.autowrite = false                            -- Do not auto-save

vim.opt.signcolumn = "yes"                           -- Always show sign column
vim.opt.clipboard = "unnamedplus"                    -- Enable system clipboard

vim.opt.number = true                                -- Show line numbers
vim.opt.relativenumber = true                        -- Show relative line numbers
vim.opt.cursorline = true                            -- Highlight current line
vim.opt.wrap = true                                  -- Wrap lines by default
vim.opt.scrolloff = 10                               -- Keep 10 lines above/below cursor

vim.opt.splitright = true                            -- Split vertically right
vim.opt.splitbelow = true                            -- Split below

vim.opt.ignorecase = true                            -- Case insensitive search
vim.opt.smartcase = true                             -- Case sensitive if uppercase in string
vim.opt.hlsearch = true                              -- Highlight search matches
vim.opt.incsearch = true                             -- Show matches as you type

vim.opt.tabstop = 2                                  -- Tabwidth
vim.opt.shiftwidth = 2                               -- Indent width
vim.opt.softtabstop = 2                              -- Soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true                             -- Use spaces instead of tabs
vim.opt.smartindent = true                           -- Smart auto-indent
vim.opt.autoindent = true                            -- Copy indent from current line

vim.opt.swapfile = false                             -- Disable swap files (less I/O)
vim.opt.backup = false                               -- Do not create backup files
vim.opt.undofile = true                              -- Persistent undo across sessions

vim.opt.showmatch = true                             -- Highlights matching brackets
vim.opt.cmdheight = 1                                -- Single line command line
vim.opt.completeopt = "menuone,noinsert,noselect"    -- Completion options
vim.opt.showmode = false                             -- Do not show the mode, instead have it in statusline
vim.opt.pumheight = 10                               -- Popup menu height
vim.opt.pumblend = 10                                -- Popup menu transparency
vim.opt.winblend = 0                                 -- Floating window transparency
vim.opt.conceallevel = 0                             -- Do not hide markup
vim.opt.concealcursor = ""                           -- Do not hide cursorline in markup
vim.opt.hidden = true                                -- Allow hidden buffers

vim.opt.fillchars = { eob = " " }                    -- Hide "~" on empty lines

vim.opt.foldmethod = "expr"                          -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding

vim.opt.path:append("**")                            -- Search files recursively in all subdirectories when using :find or gf
vim.opt.suffixesadd:append({
  ".ts",
  ".tsx",
  ".js",
  ".jsx",
  ".json",
  ".mjs",
  ".cjs",
}) -- Automatically try these file extensions when resolving files (e.g., with gf or :find)
