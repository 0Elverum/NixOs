{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      wl-clipboard
      mako
      waybar
      swayidle
      swaylock
      wmenu
      wofi
      grim
      slurp
      kitty
    ];
  };
}