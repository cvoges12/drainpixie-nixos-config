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
        PermitRootLogin = "prohibit-password";
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      htop
      neovim

      man-pages
      man-pages-posix
    ];
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
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
