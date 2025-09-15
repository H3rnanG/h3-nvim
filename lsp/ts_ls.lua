local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  name = 'ts_ls',
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = vim.fs.dirname(vim.fs.find({
    'tsconfig.json',
    'package.json',
    '.git'
  }, { upward = true })[1]),
  init_options = {
    hostInfo = 'neovim',
    typescript = {
      tsdk = '/usr/lib/node_modules/typescript/lib',
    },
  },
  capabilities = capabilities,
}

