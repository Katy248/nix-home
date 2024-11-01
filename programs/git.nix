{ ... }: {
  programs.git = {
    enable = true;
    userName = "Katy248";
    userEmail = "petrovanton247@gmail.com";
    extraConfig = { init = { defaultbranch = "main"; }; };
    ignores = [ ".env" "bin/" "obj/" ];
  };
}
