return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
            }
        })
    end
}

