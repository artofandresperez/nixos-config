{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    wiremix = {
      url = "github:tsowell/wiremix";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    
  };




  outputs = { self, nixpkgs , home-manager, wiremix , ...}: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
	  modules = [
	    ./configuration.nix
	    
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.amoeba = import ./home.nix;
	    }

	    {
	      environment.systemPackages = [
	        wiremix.packages.x86_64-linux.default
	      ];
	    }


	    ];

	};
      };
  };
}
