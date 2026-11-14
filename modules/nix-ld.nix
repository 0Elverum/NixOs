{ config, pkgs, inputs, ... }:

{
  # Nix-ld for binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      nss
      nspr
      dbus
      fontconfig
      freetype
      expat
      libwebp
      brotli
      libxkbcommon
      libglvnd
      libgbm
      libxcb
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxtst
      libxkbfile
    ];
  };
}