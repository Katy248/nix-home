{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFile = "$HOME/.cache/bash/history";
  };
}
