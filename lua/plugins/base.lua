return {
    { "nvim-lua/plenary.nvim" },
    { "folke/snacks.nvim" },
    { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
    -- { "williamboman/mason-lspconfig.nvim", config = true },
    { "hrsh7th/nvim-cmp", config = true },
    { "L3MON4D3/LuaSnip", config = true },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "nvim-lualine/lualine.nvim", config = true },
    { "lewis6991/gitsigns.nvim", config = true },
    { "nvim-tree/nvim-tree.lua", config = true },
    { "folke/which-key.nvim", config = true },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = true
    },
    { "nvim-tree/nvim-web-devicons", lazy = false },
    { "nvim-neotest/nvim-nio" },
}
