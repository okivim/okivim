return function(capabilities)
  vim.lsp.config("astro", {
    cmd = { "astro-ls", "--stdio" },
    filetypes = { "astro" },
    capabilities = capabilities,
  })
end
