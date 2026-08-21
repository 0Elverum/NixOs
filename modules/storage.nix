{ config, pkgs, ... }:

{
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/245ffb00-5004-4fb7-9b5b-ac84a9b56b5d";
    fsType = "ext4";
    options = [ "defaults" "noatime" ];
  };

  services.smartd.enable = true;
}