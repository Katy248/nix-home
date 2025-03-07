{ config, ... }: {
  services.git-sync = {
    enable = true;
    repositories = let
      HOME = config.home.homeDirectory;
      defaultSyncInterval = 3600 * 3;
    in {
      ksc = {
        uri = "git@github.com:Katy248/ksc.git";
        path = "${HOME}/src/ksc";
        interval = defaultSyncInterval;
      };
      neovim = {
        uri = "git@gitlab.com:configs505752/neovim-config.git";
        path = "${HOME}/.config/nvim";
        interval = defaultSyncInterval;
      };
      home-manager = {
        uri = "git@github.com:Katy248/nix-home.git";
        path = "${HOME}/src/nix-home";
        interval = defaultSyncInterval;
      };
    };
  };
}
