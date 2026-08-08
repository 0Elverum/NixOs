{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  
  programs.dms-shell = {
    enable = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
}