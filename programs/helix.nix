{ ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        color-modes = true;
        popup-border = "all";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        lsp = { display-messages = true; };
        indent-guides = {
          render = true;
          character = "┆";
          skip-levels = 1;
        };
        statusline = {
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
          left = [
            "file-name"
            "file-modification-indicator"
            "separator"
            "file-type"
          ];
          center = [ "mode" ];
          right = [ "version-control" "workspace-diagnostics" "position" ];
        };
      };
      keys = {
        normal = {
          space = {
            q = ":quit";
            w = ":write";
          };
        };
      };
    };
  };
}
