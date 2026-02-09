return function(capabilities)
  vim.lsp.config("angularls", {
    cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      "",
      "--ngProbeLocations",
      "",
    },
    filetypes = { "typescript", "html" },
    root_markers = { "angular.json" },
    capabilities = capabilities,
  })
end
