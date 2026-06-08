{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.name = "Elverum";
      user.email = "elverum7@proton.me";
      core.editor = "nano";
      #credential.helper = "store";
      safe.directory = "/etc/nixos";
      };
  };
}
