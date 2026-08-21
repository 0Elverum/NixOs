{ config, pkgs, inputs, ... }:

  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";  
  home.packages = with pkgs; [
  ];

  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.nixcord.homeModules.nixcord
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    colorScheme = "dark";
  };

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    config.themeLinks = [ "https://refact0r.github.io/system24/build/system24.css" ];
  };
  
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      oldLikeButton
      aiBandBlocker
      sideHide
      focusMode
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
    shellIntegration.enableBashIntegration = true;
    enableGitIntegration = true;
    font = {
      size = 12;
      name = "DejaVu Sans";
    };
    extraConfig = ''
      include themes/Broadcast.conf
      background_opacity 0.85
    '';
  };
}
