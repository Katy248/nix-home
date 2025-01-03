{ lib, ... }:
let
  additionalPaths = [ "$HOME/.local/bin/" "$HOME/go/bin/" ];
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
      plugins = [ "git" "sudo" ];
    };
    shellAliases = {
      ls =
        "eza --tree --level=1 --icons=always --color=always --all --group-directories-first --ignore-glob .git";
      cat = "bat --theme gruvbox-dark --paging never --number";
      dnfi = "sudo dnf install";
      dnfs = "dnf search";
      dnfr = "sudo dnf remove";
      dnfu = "sudo dnf upgrade";
    };
    syntaxHighlighting = { enable = true; };

    enableCompletion = true;
    initExtraBeforeCompInit = ''
      source /home/katy/.nix-profile/etc/profile.d/nix.sh
    '' + printAdditionalPaths additionalPaths;
  };
  home.sessionPath = additionalPaths;
}
