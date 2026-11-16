{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "org.vinegarhq.Sober"
    ];

    uninstallUnmanaged = true;

    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    overrides.settings = {
      global = {
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      };
    };
  };
}
