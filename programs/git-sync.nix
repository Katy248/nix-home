{ config,... }: {
  programs.git-sync = {
    enable = true;
    repositories = let HOME = config.home.homeDirectory; in{ ksc = { path ="${HOME}/src/ksc"; url = "git@github.com:Katy248/ksc.git"}; };
  };
}
