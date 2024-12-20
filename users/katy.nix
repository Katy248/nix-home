{ pkgs, ... }: {
  imports = [
    ../programs/alacritty.nix
    ../programs/git.nix
    ../programs/oh-my-posh.nix
    ../programs/zsh.nix
    ../programs/kitty.nix
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
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
    ];
  };
  fonts.fontconfig.enable = true;
  editorconfig = {
    enable = true;
    settings = let indent2 = { indent_size = 2; };
    in {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        indent_size = 4;
      };
      "*.yml" = indent2;
      "*.json" = indent2;
      "*.xml" = indent2;
    };
  };

  programs.home-manager.enable = true;
}
