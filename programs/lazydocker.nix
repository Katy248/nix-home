{ ... }: {
  programs.lazydocker = {
    enable = true;
    settings = {
      gui = {
        language = "en"; # currently no russian
        border = "rounded";
      };
    };
  };
}
