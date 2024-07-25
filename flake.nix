{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # add ags
    ags.url = "github:Aylur/ags";
  };

  outputs = { home-manager, nixpkgs, ... }@inputs:
    let system = "x86_64-linux";
    in {
      homeConfigurations = {
        katy = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./users/katy.nix ];
        };
        ruser = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./users/ruser.nix ];
        };
      };
    };
}
