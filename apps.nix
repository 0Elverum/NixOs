{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search [...]

  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnome-tweaks
    papirus-icon-theme
    pwvucontrol
    font-manager
    xarchiver
    discord
    vlc
    gimp
    drawio
    obsidian
    papers
    btop
    mousepad
    proton-vpn
    nautilus
    steam-run
  ];
}
