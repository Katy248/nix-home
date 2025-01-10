{ ... }: {
  programs.eza = {
    enable = true;
    colors = "always";
    enableBashIntegration = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
  };
}
