{ ... }: {
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
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
    shellAliases = {
      ls =
        "eza --tree --level=1 --icons=always --color=always --all --group-directories-first --ignore-glob .git";
      cat = "bat --theme gruvbox-dark --paging never --number";
      docker = "sudo docker";
      # zed = "~/.local/bin/zed";
      # lvim = "~/.local/bin/lvim";
    };

    enableCompletion = true;
    initExtraBeforeCompInit = 
    ''
      PATH=$PATH:~/go/bin
      source /home/katy/.nix-profile/etc/profile.d/nix.sh
    '';
  };
}
