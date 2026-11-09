{ config, pkgs, inputs, ... }:

{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";
    
  home.packages = with pkgs; [
    nerd-fonts._0xproto
    adw-gtk3
  ];

  imports = [];
  
  fonts.fontconfig.enable = true;

  xdg.configFile."niri".source =
    config.lib.file.mkOutOfStoreSymlink "/etc/nixos/dots/niri";

  # QT and GTK
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
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
        alpha = 0.5;
      };
    };
  };

  services.rescrobbled = {
    enable = true;
    package = pkgs.rescrobbled;
  };
}
