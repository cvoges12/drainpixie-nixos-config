{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ../../common/system.nix ];

  networking.hostName = "timeline";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system.stateVersion = "24.05";
}
