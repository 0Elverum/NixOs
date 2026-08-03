{ config, pkgs, inputs, ... }:
  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
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
    mpv
    eog # Eye of Gnome
    gimp
    drawio
    obsidian
    papers
    btop
    mousepad
    proton-vpn
    protonup-qt
    nautilus
    steam-run
    wget2
  ];
}
