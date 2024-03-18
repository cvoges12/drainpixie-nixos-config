{
  description = "faye's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.incubator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/incubator/configuration.nix ];
      };

      # todo: timeline (latitude 5490)
      # timeline = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [ ./hosts/timeline/configuration.nix ];
      # };
    };
}