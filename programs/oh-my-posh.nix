{ config, pkgs, ... }: {
  programs.oh-my-posh = {
    enable = true;
    useTheme = "gruvbox";

    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
