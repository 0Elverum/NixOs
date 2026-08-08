{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  
  programs.dms-shell = {
    enable = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableCalendarEvents = true;
  };

  services.displayManager.dms-greeter = {
  compositor = {
    name = "niri";
  };
  configHome = "/home/elverum";
    logs = {
      save = true; 
      path = "/tmp/dms-greeter.log";
    };
  };
}