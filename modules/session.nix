{ config, pkgs, ... }:

{
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/elverum";
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };

  programs.niri.enable = true;
  
  programs.dms-shell = {
    enable = true;
    enableAudioWavelength = true;
    enableDynamicTheming = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
