{ config, pkgs, inputs, ... }:

  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
  ];

  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  xdg.desktopEntries = {
    "Kitty-ranger" = {
      name = "ranger";
      comment = "Ranger file manager";
      exec = "kitty -e ranger";
      icon = "kitty";
      terminal = false;
      type = "Application";
      categories = [ "Utility" "FileManager" ];
    };
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };

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
