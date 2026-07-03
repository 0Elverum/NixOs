# /etc/nixos/home.nix
{ config, pkgs, ... }:

{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";

  # Paquetes solo para el usuario
  home.packages = with pkgs; [
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-es
      jnoortheen.nix-ide
      enkia.tokyo-night
      ];
    };

  programs.ranger = {
    enable = true;
      settings = {
        preview_images = true;
        preview_images_method = "kitty";
        draw_borders = "both";
        colorscheme = "snow";
      };
  };

  programs.kitty = {
    enable = true;
    settings = {
      fontSize = 12;
      theme = "OneDark";
    };
  };

}
