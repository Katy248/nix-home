{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNF";
      size = 12;
    };
    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    theme = "Gruvbox Dark";
    settings = {
      disable_ligatures = "never";
      background_opacity = "0.9";
    };
  };
}
