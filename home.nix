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
    alacritty = {
      enable = true;
      settings = {
        shell = "zsh";
        cursor.style = {
            blinking = "On";
            shape = "Beam";
        };
        window = {
          dynamic_title = true;
          title = "Terminal";
          padding = { x = 10; y = 10; };
          opacity = 0.9;
        };
        font = {
          size = 11;
          normal.family = "JetBrainsMono NL";
        };
        colors = {
          primary = {
            background = "#282828";
            foreground = "#ebdbb2";
          };
          normal = {
            black = "#282828";
            red = "#cc241d";
            green = "#98971a";
            yellow = "#d79921";
            blue = "#458588";
            magenta = "#b16286";
            cyan = "#689d6a";
            white = "#a89984";
          };
          bright = {
            black = "#928374";
            red = "#fb4934";
            green = "#b8bb26";
            yellow = "#fabd2f";
            blue = "#83a598";
            magenta = "#d3869b";
            cyan = "#8ec07c";
            white = "#ebdbb2";
          };
        };
      };
    };
    git = {
      enable = true;
      userName = "Katy248";
      userEmail = "petrovanton247@gmail.com";
    };
    zsh = {
      enable = true;
      antidote = {
        enable = true;
      };
      autosuggestion = {
        enable = true;
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git" "sudo"
        ];
      };
      shellAliases = {
        ls = "eza --tree --level=1 --icons=always --color=always --all --group-directories-first";
        cat = "bat --theme gruvbox-dark --paging never --number";
      };
    };
    oh-my-posh = {
      enable = true;
      useTheme = "gruvbox";

      enableBashIntegration = true;
      enableZshIntegration = true;
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
    bat # better cat
    eza # better ls
    nil marksman omnisharp-roslyn # language servers
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
