{ ... }: {
  programs.lazydocker = {
    enable = true;
    settings = {
      gui = {
        language = "ru";
        border = "rounded";
      };
    };
  };
}
