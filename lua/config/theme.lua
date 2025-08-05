require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  integrations = {
    telescope = true,
    which_key = true,
    nvimtree = true,
    treesitter = true,
    cmp = true,
    lsp_trouble = true,
    mason = true,
  },
})

vim.cmd.colorscheme("catppuccin")
