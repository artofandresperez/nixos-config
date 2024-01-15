{
  description = "A very basic flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    nur.url = "github:nix-community/NUR";


  };

  outputs = { self, nixpkgs , home-manager, nur , ... }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;

      };
      lib = nixpkgs.lib;

    in { 
      nixosConfigurations = {
        amoeba-ln = lib.nixosSystem {
          inherit system;
          modules = [ ./devices/laptop-nvidia/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amoeba = import ./devices/laptop-nvidia/home.nix;
          }
          nur.nixosModules.nur
          ];
        };

      };
    };



  }
