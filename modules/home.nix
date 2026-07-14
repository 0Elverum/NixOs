{ config, pkgs, ... }:

{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
  ];

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
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
