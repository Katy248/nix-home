{ pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    stateVersion = "25.05";
    shell = {
      enableShellIntegration = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
  programs.home-manager.enable = true;
}
