{ config, pkgs, inputs, ... }:

{
  # Nix-ld
  # LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH ldd /path/to/program | grep "not found"
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
    ];
  };
}