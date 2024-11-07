{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ... }@inputs:
    let
      configFromUsername = username:
        home-manager.lib.homeManagerConfiguration {
          pkgs = let system = "x86_64-linux";
          in import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./users/${username}.nix ];
        };
    in {
      homeConfigurations = {
        katy = configFromUsername "katy";
        ruser = configFromUsername "ruser";
      };
    };
}
