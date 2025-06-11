{
  description = "system configuration of unknowndimension";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = { 
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, chaotic, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
       
      homeConfigurations."unknowndimension" = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages.${system};
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        extraSpecialArgs = { inherit inputs; };
        
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home/home.nix 
          inputs.stylix.homeModules.stylix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      
      nixosConfigurations."myNixos" = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs { 
         # nixpkgs.legacyPackages.${system};
         inherit system;
         config.allowUnfree = true;
        };
        specialArgs = {inherit inputs;};
        modules = [ 
          ./profiles/genesis.nix 
          chaotic.nixosModules.default
       #   inputs.stylix.nixosModules.stylix
        ];
      };



    };
}


