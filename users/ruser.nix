{ pkgs, ... }:

{
  imports = [
    ../hm-base.nix

    ../programs/git.nix
    ../programs/helix.nix
    ../programs/oh-my-posh.nix
    ../programs/zsh.nix
    ../programs/eza.nix
    ../programs/bat.nix
    ../programs/fastfetch.nix
  ];
  home = {
    username = "ruser";
    homeDirectory = "/home/ruser";
    sessionVariables = { };
    packages = with pkgs; [
      gh
      nil
      marksman
      just
      nixfmt # language servers
    ];
  };
}
