{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Katy248";
      user.email = "petrovanton247@gmail.com";
      init = { defaultbranch = "main"; };
    };
    ignores = [ ".env" "bin/" "obj/" ];
  };
}
