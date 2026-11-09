{ config, pkgs, inputs, ... }:

  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  programs.niri.enable = true;

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    recommendedServices.enable = false;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor = {
        size = 32;
      };
    };
  };
}
