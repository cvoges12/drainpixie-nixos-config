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
      htop
      neovim

      man-pages
      man-pages-posix
    ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
      };

      efi.canTouchEfiVariables = true;
    };
  };

  users.motd = with config; ''
    Incubator; Faye's Homeserver

    OS      : NixOS ${system.nixos.release} (${system.nixos.codeName})
    Version : ${system.nixos.version}
    Kernel  : ${boot.kernelPackages.kernel.version}
  '';

  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

  users.users.kyubey = {
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFHNQwE4WjjUdFpJ+5XhKJSUY0WBO5OWA5ww1G48/Eab/oJpAzP68tKtT7PRHL3uXp/9xDs6dR20GLfF9xJa48TDWE2tYvtdG5TUK6IcfSYIgLw2mh6pJTc0Z97kM17Gu9snm0IHj15szXK2uovly06xd4HccIJV2e9VlvFh5AJaZ4tEqDhUU099nSNM6/Czp9nSuq/VAjNTu9iV5Vh12zOKWF/OvH5Q0tpKjBqURV/vOsJ9W8c+5KVmnDYTxKq/4zNLeyRJ25WlSSbsfVYxcoXLxnTlE5lyLabqgmOz3a9//rtnb8SUGvgWgkKbeCI/tYCO2JIt27SHgnao4CO+ZeL/L9GsyNgOnf7zr1aeSrOz4MNRdVBClwDTl0qQ3XKnJDw6n2v1TPOQrq67aPjoQl6AGsvnZXg68OOqJ+5Zgp0eRlUPiySHSY62cmMSEuER81INKsElLE60rYH3Pxt4ekm+FrmhDgvMXoHrt6VpUX6HNiXMcN8q/fVnto8i+D0Mc="
    ];
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
