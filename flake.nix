{
  description = "A very basic flake";


  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };

    nur.url = "github:nix-community/NUR";

    xremap-flake.url = "github:xremap/nix-flake";


  };

  outputs = { self, nixpkgs , home-manager, nur , ... }@inputs: 
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
          specialArgs = {
            inherit inputs ;
          };
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
        amoeba-dn = lib.nixosSystem {
          specialArgs = {
            inherit inputs ;
          };
          inherit system;
          modules = [ ./devices/desktop-nvidia
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amoeba = import ./devices/desktop-nvidia/home.nix;
          }
          nur.nixosModules.nur
          ];
        };
        amoeba-uv = lib.nixosSystem {
          specialArgs = {
            inherit inputs ;
          };
          inherit system;
          modules = [ ./devices/universal
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amoeba = import ./devices/universal/home.nix;
          }
          nur.nixosModules.nur
          ];
        };
        amoeba-tp = lib.nixosSystem {
          specialArgs = {
            inherit inputs ;
          };
          inherit system;
          modules = [ ./devices/thinkpad
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amoeba = import ./devices/thinkpad/home.nix;
          }
          nur.nixosModules.nur
          ];
        };
      };
    };



  }
