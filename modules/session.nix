{ config, pkgs, inputs, ... }:

{
  services.displayManager.dms-greeter = {
    enable = true;
    package = inputs.dms-greeter.package.${pkgs.stdenv.hostPlatform.system}.default;
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
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;

  enableDynamicTheming = true;
  enableClipboardPaste = false;
  enableSystemMonitoring = false;
  enableAudioWavelength = false;
  enableCalendarEvents = false;
  enableVPN = false;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
