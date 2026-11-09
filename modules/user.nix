{ config, pkgs, ... }:

{
  users.users."elverum" = {
    isNormalUser = true;
    description = "Elverum";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    # Packages only for this user.
    ];
  };
}