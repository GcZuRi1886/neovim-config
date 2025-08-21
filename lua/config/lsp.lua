require("mason").setup()

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true })
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }
  })
})


vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
