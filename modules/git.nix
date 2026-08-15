{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "0Elverum";
      user.email = "elverum7@proton.me";
      core.editor = "nano";
      credential.helper = "store";
      };
  };
}
