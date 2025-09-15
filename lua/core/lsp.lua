vim.lsp.enable({
  'lua_ls',
  'html_ls',
  'css_ls',
  'ts_ls',
  'astro'
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})

-- LSP handlers with rounded borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Buffer-local keymaps for LSP when a server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspKeymaps', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true, noremap = true }
    local map = function(mode, lhs, rhs, desc)
      opts.desc = desc
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Go to / info
    map('n', 'gd', vim.lsp.buf.definition, 'LSP: Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'LSP: Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'LSP: References')
    map('n', 'gt', vim.lsp.buf.type_definition, 'LSP: Type definition')
    map('n', 'K', vim.lsp.buf.hover, 'LSP: Hover docs')

    -- Inlay hints if supported (Neovim 0.10+)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      pcall(vim.lsp.inlay_hint.enable, event.buf, true)
    end
  end,
})
