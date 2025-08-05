require("mason").setup()

local mason_lsp = require("mason-lspconfig")

mason_lsp.setup({
  ensure_installed = { "lua_ls", "typescript-language-server", "pyright", "rust_analyzer" }
})

local lspconfig = require("lspconfig")

-- Check if the setup_handlers function exists
if mason_lsp.setup_handlers then
  mason_lsp.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({})
    end
  })
else
  -- Fallback: manually loop through installed servers
  for _, server_name in ipairs(mason_lsp.get_installed_servers()) do
    lspconfig[server_name].setup({})
  end
end

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }
  })
})


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
