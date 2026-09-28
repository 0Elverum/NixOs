{ config, pkgs, inputs, ... }:

{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";
    
  home.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  imports = [];
  
  fonts.fontconfig.enable = true;

  xdg.configFile."niri".source =
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dots/niri";

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

  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
      package = [ pkgs.kdePackages.qt6ct pkgs.libsForQt5.qt5ct ];
    };
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  # VSCodium
  programs.vscodium = {
    enable = true;
    profiles = {
      default = {
        userSettings = {
        "editor.fontFamily" = "'0xProto Nerd Font', monospace";
        "workbench.colorTheme" = "Tokyo Night";
        };
      
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          enkia.tokyo-night
          ms-ceintl.vscode-language-pack-es
        ];
      };
    };
  };
  
  # Foot
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "0xProtoNerdFont:size=12";
      };
      colors-dark = {
        alpha = 0.85;
      };
    };
  };
}
