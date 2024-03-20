{ pkgs, ... }: {
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  environment = { systemPackages = with pkgs; [ git neovim ]; };

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    settings.auto-optimise-store = true;

    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  networking = {
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    networkmanager.enable = true;
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };
}
