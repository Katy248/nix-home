{ ... }: {
  programs.oh-my-posh = {
    enable = true;
    # useTheme = "gruvbox";

    # enableBashIntegration = true;
    enableZshIntegration = true;

    settings = builtins.fromJSON (builtins.readFile ./oh-my-posh-theme.jsonc);
  };
}
