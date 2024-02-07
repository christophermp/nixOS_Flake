{
    description = "TotalOS";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	nixpkgs_patched.url = "github:nixos/nixpkgs/468a37e6ba01c45c91460580f345d48ecdb5a4db";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
	hyprland.url = "github:hyprwm/Hyprland";
    	hyprland-plugins = {
      		url = "github:hyprwm/hyprland-plugins";
      		inputs.hyprland.follows = "hyprland";
    	};
	nixvim = {
      		url = "github:nix-community/nixvim";
      		inputs.nixpkgs.follows = "nixpkgs";
   	};

    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in  {
        nixosConfigurations = {
            desktop = lib.nixosSystem {
                inherit system;
                modules = [ ./system/desktop/configuration.nix 
			home-manager.nixosModules.home-manager {
	    			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
            			home-manager.backupFileExtension = "backup";
	    			home-manager.users.total = import ./system/desktop/home.nix;
	    		}
		];
            };




   	 };

      };

}
