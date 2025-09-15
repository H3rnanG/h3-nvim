local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  name = "astro_lsp",
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_dir = vim.fs.dirname(vim.fs.find({
    "astro.config.mjs",
    "astro.config.ts",
    "package.json",
    ".git",
  }, { upward = true })[1]),
  init_options = {
    typescript = {
      tsdk = "/usr/lib/node_modules/typescript/lib",
    },
  },
  capabilities = capabilities,
}
