{ pkgs }: {
  programs.ssh.startAgent = true;

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  environment = { systemPackages = with pkgs; [ git neovim ]; };

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
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
