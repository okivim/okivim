return function(capabilities)
  vim.lsp.config("angularls", {
    cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations", "",
      "--ngProbeLocations", "",
    },
    filetypes = { "typescript", "html" },

    root_dir = function(fname)
      return require("lspconfig.util").root_pattern("angular.json", "project.json")(fname)
    end,

    capabilities = capabilities,
  })
end
