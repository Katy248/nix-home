{ ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        mouseEvents = true;
        sidePanelWidth = 0.25;
        language = "ru";
        nerdFontsVersion = 3;
      };
      quitOnTopLevelReturn = true;
    };
  };
}
