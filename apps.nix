{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search [...]

  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks
    gnomeExtensions.gsconnect
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnome-tweaks
    gnome-themes-extra
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
    nautilus
    proton-vpn
    steam-run
  ];
}
