{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "glow-nix";

  # Networking
  networking.networkmanager.enable = true;

  # Firewall ports
  networking.firewall.enable = true;
}