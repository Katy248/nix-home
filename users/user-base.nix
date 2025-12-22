{ pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  home = {
    stateVersion = "26.05";
    enableNixpkgsReleaseCheck = true;
    shell = {
      enableShellIntegration = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
  programs.home-manager.enable = true;
}
