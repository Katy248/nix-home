{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      # name = "CaskaydiaMono";
      size = 12;
    };
    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    themeFile = "GruvboxMaterialDarkMedium";
    settings = {
      disable_ligatures = "never";
      background_opacity = "0.9";
    };
  };
}
