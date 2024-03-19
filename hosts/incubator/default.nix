{
  self,
  config,
  pkgs,
  lib,
  ...
}:

{
  # kyubey@incubator
  # homeserver

  imports = [
    ./hardware-configuration.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "incubator";
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];

    networkmanager.enable = true;
  };

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

  environment = {
    systemPackages = with pkgs; [
      git
      neovim
    ];
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

  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "24.05";
}
