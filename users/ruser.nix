{ pkgs, ... }:

{
  imports = [
    ../programs/git.nix
    ../programs/helix.nix
    ../programs/oh-my-posh.nix
    ../programs/zsh.nix
    ../programs/eza.nix
    ../programs/bat.nix
    ../programs/fastfetch.nix
  ];
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    username = "ruser";
    homeDirectory = "/home/ruser";
    stateVersion = "24.11";
    sessionVariables = { };
    packages = with pkgs; [
      gh
      nil
      marksman
      just
      nixfmt # language servers
    ];
  };

  programs = { home-manager.enable = true; };
}
