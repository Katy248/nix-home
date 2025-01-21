{ ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      number = true;
      paging = "never";
    };
  };
}
