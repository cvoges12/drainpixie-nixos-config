{
  description = "faye's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixos-hardware
    , home-manager
    , ...
    } @inputs: {
      nixosConfigurations.incubator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
	  ./users/kyubey 
          ./hosts/incubator
          
          nixos-hardware.nixosModules.common-cpu-intel-sandy-bridge
          nixos-hardware.nixosModules.common-gpu-nvidia
          nixos-hardware.nixosModules.common-pc-hdd
        ];
      };

      # todo: timeline (latitude 5490)
      # timeline = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [ 
      #     ./hosts/timeline/configuration.nix
      #
      #     nixos-hardware.nixosModules.dell-latitude-5520
      #   ];
      # };
    };
}
