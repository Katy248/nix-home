{ pkgs, ... }:

{

  imports = [
    ../programs/alacritty.nix
    ../programs/git.nix
    # ../programs/helix.nix
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
    sessionVariables = { EDITOR = "lvim"; };
    packages = with pkgs; [
      gh
      bat # better cat
      eza # better ls
      figlet # write big ascii text
      nil # nix language server
      marksman
      omnisharp-roslyn
      just
      nixfmt-classic # nix formatter
      lazygit # git tui
      shfmt # shell formatter
      fastfetch

      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      jetbrains-mono
    ];
  };
  fonts.fontconfig.enable = true;
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        indent_size = 4;
      };
    };
  };

  programs.home-manager.enable = true;
}
