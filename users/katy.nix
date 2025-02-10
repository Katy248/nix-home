{ pkgs, ... }: {
  _module.args.font = {
    monospace = {
      name = "Caskaydia Cove Nerd Font";
      size = 12;
    };
  };

  imports = [
    ../programs/alacritty.nix
    ../programs/git.nix
    ../programs/oh-my-posh.nix
    ../programs/zsh.nix
    ../programs/kitty.nix
    ../programs/eza.nix
    ../programs/bat.nix
    ../programs/fastfetch.nix
    ../programs/lazygit.nix
    ../programs/neovim.nix
  ];
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-window = true;
      attach-modal-dialogs = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ "<Super>Space" "<Shift>Alt_L" "<Shift>Alt_R" ];
      toggle-maximized = [ "<Super>Up" "<Super>f" ];
      toggle-fullscreen = [ "<Super><Shift>f" ];
      close = [ "<Alt>F4" "<Super>q" ];
    };
  };
  home = {
    username = "katy";
    homeDirectory = "/home/katy";
    stateVersion = "24.11";
    sessionVariables = { EDITOR = "lvim"; };
    packages = with pkgs; [
      gh
      figlet # write big ascii text
      nil # nix language server
      marksman
      omnisharp-roslyn
      just
      nixfmt-classic # nix formatter
      shfmt # shell formatter
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      go
      gopls
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
