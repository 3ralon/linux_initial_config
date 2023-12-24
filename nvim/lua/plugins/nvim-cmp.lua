return {
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-vsnip'},
  {'L3MON4D3/LuaSnip'},
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')
      cmp.setup({
	snippet = { expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
	  ['<Tab>'] = cmp.mapping.select_next_item(),
	  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'vsnip' },
	  },
	  {
	    { name = 'buffer' },
	})
      })
      cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	  { name = 'git' },
	  }, {
	    { name = 'buffer' },
	})
      })
      cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
      })
      cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	  }, {
	    { name = 'cmdline' }
	})
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig')['jedi_language_server'].setup({
	capabilities = capabilities
      })
    end
  },
}

