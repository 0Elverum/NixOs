# /etc/nixos/home.nix
{ config, pkgs, ... }:

{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";

  # Paquetes solo para el usuario
  home.packages = with pkgs; [
  ];

  programs.kitty = {
    enable = true;
    themeFile = "TokyoNight";
    settings = {
      font_size = 12;
    };
  };

  programs.ranger = {
    enable = true;
    settings = {
      preview_images = true;
      preview_images_method = "kitty";
      colorscheme = "snow";
      draw_borders = true;
    };
  };
}