{
  description = "faye's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      incubator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/incubator.nix ];
      };
    };
}
