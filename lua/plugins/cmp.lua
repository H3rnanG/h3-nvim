return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.setup({
        history = true,
        delete_check_events = 'TextChanged',
      })
    end,
  },
  {
    'rafamadriz/friendly-snippets',
    lazy = true,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      -- Icons similar to blink's nerd font look
      lspkind.init({
        mode = 'symbol_text',
        preset = 'default',
        symbol_map = {},
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter to confirm current item, selecting first if none selected
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '…',
          }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer' },
        }),
        experimental = {
          ghost_text = false,
        },
        sorting = {
          -- Keep default sorting; blink used fuzzy, cmp's default is reasonable
        },
      })

      -- Optional: cmdline completion similar to general UX
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
      })

      -- Integrate with nvim-autopairs if present
      local ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
      if ok then
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end

      -- If using vim.lsp.enable, try to enhance capabilities globally when available
      local ok_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
      if ok_lsp and vim.lsp and vim.lsp.config then
        local caps = cmp_lsp.default_capabilities()
        -- Apply as default capabilities for all servers
        vim.lsp.config('*', { capabilities = caps })
      end
    end,
  },
}
