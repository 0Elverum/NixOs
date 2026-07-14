{ config, pkgs, ... }:
{

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.clipboard-indicator
    gnome-tweaks
    papirus-icon-theme
    pwvucontrol
    font-manager
    xarchiver
    discord
    eog # Eye of Gnome
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
