{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./pipewire.nix
    ./xserver.nix

    ../../common/system.nix
  ];

  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  networking.hostName = "timeline";
  powerManagement.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  services = { upower.enable = true; };

  system.stateVersion = "24.05";
}
