{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "glow-nix";

  # Networking
  networking.networkmanager.enable = true;

  # Firewall ports
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };
}