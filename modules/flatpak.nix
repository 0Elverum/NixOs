{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
    "org.onlyoffice.desktopeditors"
    "com.stremio.Stremio"
    "io.github.astralvixen.geforce-infinity"
  ];

  services.flatpak.uninstallUnmanaged = true;

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
