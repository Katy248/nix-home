{ lib, ... }:
let
  additionalPaths = [
    "$HOME/.local/bin/"
    "$HOME/go/bin/"
    "$HOME/.cargo/bin/"
    "$HOME/.dotnet/tools"
    "$HOME/.docker/completions"
  ];
  printAddPath = path: ''
    PATH+=":${path}"
  '';
  printAdditionalPaths = paths: lib.concatMapStrings printAddPath paths;
in {
  programs.zsh = {
    enable = true;
    antidote = { enable = true; };
    autosuggestion = { enable = true; };
    history = {
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      size = 5000;
      path = "$HOME/.cache/zsh-history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "colored-man-pages" "git" "sudo" ];
    };
    shellAliases = {
      clone = "git clone";
      cat = "bat";
      neofetch = "fastfetch";
      ff = "fastfetch";
      # dnf aliases
      dnfi = "sudo dnf install";
      dnfs = "dnf search";
      dnfr = "sudo dnf remove";
      dnfu = "sudo dnf upgrade";
      # pacman aliases
      paci = "sudo pacman -S";
      pacr = "sudo pacman -Rsu";
      pacs = "pacman -Ss";
      pacu = "sudo pacman -Syu";
    };
    syntaxHighlighting = { enable = true; };

    enableCompletion = true;
    initContent = ''
      bindkey -v
    '' + printAdditionalPaths (additionalPaths) + ''
      . /home/katy/.nix-profile/etc/profile.d/nix.sh
    '';
  };
  home.sessionPath = additionalPaths;
}
