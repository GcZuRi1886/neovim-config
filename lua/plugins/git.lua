return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit (popup)" },
      { "<leader>gF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit: Current file" },
    },
    init = function()
      -- Optional UI tweaks for the floating window
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_use_plenary = 1
      vim.g.lazygit_use_neovim_remote = 1
    end,
  },
}
