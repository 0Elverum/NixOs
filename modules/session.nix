{ config, pkgs, inputs, ... }:

  let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  programs.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/elverum";
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };

  programs.niri.enable = true;
  
  programs.dank-material-shell = {
    enable = true;
    quickshell.package = unstable.quickshell;
    
    enableVPN = true;
    enableDynamicTheming = true;
    enableClipboardPaste = true;
    enableSystemMonitoring = false;
    enableAudioWavelength = false;
    enableCalendarEvents = false;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
