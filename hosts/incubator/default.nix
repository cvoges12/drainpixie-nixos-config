{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../../common/system.nix ];

  networking.hostName = "incubator";

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;

        PermitRootLogin = "prohibit-password";
      };
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      grub = {
        device = "/dev/sda";
        enable = true;
      };
    };
  };

  system.stateVersion = "24.05";
}
