{ config, lib, pkgs, ... }:

let
  cfg = config.NixFlatpak;
in
{
  options.NixFlatpak = {
    enable = lib.mkEnableOption "Gestión declarativa de Flatpaks";
    
    remotes = lib.mkOption {
      type = lib.types.listOf ( lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "Nombre del remoto";
          };

          url = lib.mkOption {
            type = lib.types.str;
            description = "URL del Remoto";
          };
        };
      });
      
      default = [];
      description = "Modulo para agregar paquetes y remotos adicionales desde flatpak";
    };

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Id de aplicaciones a instalar desde flatpak";
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;

    systemd.services.flatpak-custom-setup = {
      description = "Configura remotos e instala paquetes de flatpak";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      script = let 
        remoteAdds = lib.concatMapStringsSep "\n" (r: ''
          echo "Agregando remoto ${r.name}..."
          flatpak remote-add --if-not-exists ${r.name} ${r.url}
        '') cfg.remotes;

        packageInstalls = lib.concatMapStringsSep "\n" (p: ''
          echo "Instalando paquete ${p}..."
          flatpak install --noninteractive --or-update flathub ${p}
        '') cfg.packages;
      in
      ''
        #!/usr/bin/env bash
        set -euo pipefail
        ${remoteAdds}
        ${packageInstalls}
        echo "Todo se ha configurado correctamente"
      '';

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        Environment = "PATH=${lib.makeBinPath [ pkgs.flatpak ]}";
      };
    };
  };
}