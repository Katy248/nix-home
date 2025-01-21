{ ... }: {
  programs.eza = {
    enable = true;
    colors = "always";
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableIonIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
    extraOptions = [
      "--tree"
      "--level=1"
      "--all"
      "--group-directories-first"
      "--ignore-glob=.git"
    ];
  };
}
