{ pkgs, ... }: {
  programs.vscode = {
    enable = false;
    extensions = with pkgs.vscode-extensions; [
      # Spell cheker
      streetsidesoftware.code-spell-checker
      # Themes
      jdinhlife.gruvbox
      pkief.material-icon-theme
      pkief.material-product-icons
      # Markdown
      yzhang.markdown-all-in-one
    ];
  };
}
