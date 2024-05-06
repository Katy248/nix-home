{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    username = "katy";
    homeDirectory = "/home/katy";
    stateVersion = "23.11";
    language =
    let
      russian = "ru_RU.UTF-8";
      english = "en_US.UTF-8";
    in {
      base = english;
      # messages = russian;
      measurement = russian;
      monetary = russian;
      # name = russian;
      numeric = russian;
      paper = russian;
      # telephone = russian;
      time = russian;
    };
    sessionVariables = {};
  };

  gtk = {
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    theme = {
      name = "Adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };
  
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Katy248";
      userEmail = "petrovanton247@gmail.com";
    };
    helix = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        # nil marksman omnisharp-roslyn # language servers
      ];
      settings = {
        theme = "gruvbox";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
  services = {
    syncthing = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    gh
    
    nil marksman omnisharp-roslyn # language servers
  ];
}
