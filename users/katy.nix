{ inputs, config, pkgs, ... }:

{

  imports = [
    ../programs/alacritty.nix
    ../programs/git.nix
    ../programs/helix.nix
    ../programs/oh-my-posh.nix
    ../programs/zsh.nix
    ../programs/kitty.nix
    # ./programs/ags.nix
    # ./programs/vscode.nix
  ];
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    username = "katy";
    homeDirectory = "/home/katy";
    stateVersion = "24.11";
    sessionVariables = { };
    packages = with pkgs; [
      gh
      bat # better cat
      eza # better ls
      figlet # write big ascii text

      # pandoc texliveFull # documents

      nil
      marksman
      omnisharp-roslyn
      just
      nixfmt # language servers
      lazygit

      fastfetch

      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
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
}
