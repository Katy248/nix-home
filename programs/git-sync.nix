{ config, ... }: {
  services.git-sync = {
    enable = true;
    repositories = let HOME = config.home.homeDirectory;
    in {
      ksc = {
        uri = "git@github.com:Katy248/ksc.git";
        path = "${HOME}/src/ksc";
      };
      neovim = {
        uri = "git@gitlab.com:configs505752/neovim-config.git";
        path = "${HOME}/.config/nvim";
      };
      home-manager = {
        uri = "git@github.com:Katy248/nix-home.git";
        path = "${HOME}/src/nix-home";
      };
    };
  };
}
