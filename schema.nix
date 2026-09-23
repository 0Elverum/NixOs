{ config, lib, pkgs, ... }:

let
  gtk3Schemas = pkgs.runCommand "gtk3-gsettings-schemas" {} ''
    mkdir -p $out
    cp ${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas/*.xml $out/
    ${pkgs.glib.dev}/bin/glib-compile-schemas $out
  '';
in
{
  environment.variables.GSETTINGS_SCHEMA_DIR = "${gtk3Schemas}";
}