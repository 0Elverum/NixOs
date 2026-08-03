{ config, pkgs, inputs, ... }:

  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
{
  home.username = "elverum";
  home.homeDirectory = "/home/elverum";
  home.stateVersion = "26.05";  
  home.packages = with pkgs; [
  ];

  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.nixcord.homeModules.nixcord
  ];

  xdg.desktopEntries = {
    "Kitty-ranger" = {
      name = "ranger";
      comment = "Ranger file manager";
      exec = "kitty -e ranger";
      icon = "kitty";
      terminal = false;
      type = "Application";
      categories = [ "Utility" "FileManager" ];
    };
  };

  programs.neovim = {
    enable = true;
    initLua = ''
        vim.opt.number = true
        vim.opt.relativenumber = false
        vim.opt.cursorline = true
        vim.opt.expandtab = true
        vim.opt.tabstop = 4

        vim.lsp.config.nixd = {
          cmd = { "nixd" },
          filetypes = { "nix" },
          }
        vim.lsp.enable("nixd")
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      '';
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      nvim-treesitter
      lualine-nvim
      nvim-lspconfig
    ];
    extraPackages = with pkgs; [
      nixd
    ];
  };

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    config.themeLinks = [ "https://refact0r.github.io/system24/build/system24.css" ];
  };
  
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      oldLikeButton
      aiBandBlocker
      sideHide
      focusMode
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-es
      jnoortheen.nix-ide
      enkia.tokyo-night
      ];
    };

  programs.ranger = {
    enable = true;
      settings = {
        preview_images = true;
        preview_images_method = "kitty";
        draw_borders = "both";
        colorscheme = "snow";
      };
  };

  programs.kitty = {
    enable = true;
    settings = {
      fontSize = 12;
      theme = "OneDark";
    };
  };

}
