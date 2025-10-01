{ config, pkgs, ... }:

{
  home.username = "fabian";
  home.homeDirectory = "/home/fabian";
  home.stateVersion = "25.05"; # match your system version
  ##home.shell = pkgs.zsh;

  programs.home-manager.enable = true;

  #home.packages = with pkgs; [
  #  home-manager
  #];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      telescope-nvim
      nvim-treesitter
      gruvbox-nvim
      lualine-nvim
      nvim-lspconfig
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };

    history.size = 10000;
  };

  # Neovim config
  xdg.configFile."nvim/init.lua".text = ''
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.termguicolors = true

    vim.cmd("colorscheme gruvbox")

    require('lualine').setup()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = true }
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup {}
  '';
}

