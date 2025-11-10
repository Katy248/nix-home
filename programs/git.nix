{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.ame = "Katy248";
      user.email = "petrovanton247@gmail.com";
      init = { defaultbranch = "main"; };
    };
    ignores = [ ".env" "bin/" "obj/" ];
  };
}
