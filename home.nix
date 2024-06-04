{ config, pkgs, ... }:

{

  imports = [
    ./programs/alacritty.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/oh-my-posh.nix
    ./programs/zsh.nix
  ];
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    username = "katy";
    homeDirectory = "/home/katy";
    stateVersion = "23.11";
    language = let
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
    sessionVariables = { };
  };

  programs = {

    home-manager.enable = true;

    gnome-shell = {
      enable = true;
      # extensions = with pkgs.gnomeExtensions; [
      #  dash-to-panel
      # ];
    };

  };
  home.packages = with pkgs; [
    gh
    bat # better cat
    eza # better ls
    figlet # write big ascii text

    # pandoc texliveFull # documents

    nil
    marksman
    omnisharp-roslyn
    nixfmt # language servers
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    alacritty
  ];
}
