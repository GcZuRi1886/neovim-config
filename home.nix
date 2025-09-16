{ config, pkgs, ... }:

{
  home.username = "fabian";
  home.homeDirectory = "/home/fabian";
  home.stateVersion = "25.05"; # match your NixOS release

  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "GcZuRi1886";
    userEmail = "odermattfabian7@gmail.com";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    firefox
  ];
}

