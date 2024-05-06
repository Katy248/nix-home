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

  home.packages = with pkgs; [
    helix
    git
    gh
    # language servers
    omnisharp-roslyn nil marksman
  ];
}
