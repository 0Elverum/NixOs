{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [
      wl-clipboard
      mako
      waybar
      swayidle
      swaylock
      wmenu
      wofi
      grim
      slurp
      foot
    ];
  };
}