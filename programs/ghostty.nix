{ font, ... }: {
  programs.ghostty = {
    enable = true;
    # integration
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # syntax
    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      font-family = font.monospace.name;
      theme = "light:Gruvbox Light,dark:Gruvbox Dark";
      background-opacity = 0.9;
      background-blur = true;
      window-padding-x = 10;
      window-padding-y = 10;

      window-theme = "system";
    };
  };
}
