{ font, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = font.monospace.name;
      size = font.monospace.size;
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
      tab_bar_style = "powerline";
    };
  };
}
