return {
  -- Mason: installs and manages external tools like LSP servers
   {
        "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
      }),
    })
  end,
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  },
  {
    'hrsh7th/cmp-nvim-lsp',
        opts={}
},
  -- nvim-lspconfig: connects Neovim to installed LSP servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.pyright.setup({capabilities = capabilities})
      lspconfig.rust_analyzer.setup({capabilities = capabilities})
      lspconfig.clangd.setup({capabilities = capabilities})
    end
  },

}
