{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      audacious = prev.audacious.overrideAttrs (old: {
        mesonFlags = (builtins.filter (f: f != "-Dgtk=false") old.mesonFlags) ++ [
          "-Dgtk=true"
          "-Dlibarchive=true"   # necesario para leer los .wsz (son zips)
        ];
        buildInputs = old.buildInputs ++ [ final.gtk3 final.libarchive ];
        nativeBuildInputs = old.nativeBuildInputs ++ [ final.wrapGAppsHook ];
      });

      audacious-plugins = prev.audacious-plugins.overrideAttrs (old: {
        mesonFlags = (builtins.filter (f: f != "-Dgtk=false") old.mesonFlags) ++ [
          "-Dgtk=true"
        ];
        buildInputs = old.buildInputs ++ [ final.gtk3 ];
      });
    })
  ];

  environment.systemPackages = [
    pkgs.audacious
    pkgs.audacious-plugins
  ];
}