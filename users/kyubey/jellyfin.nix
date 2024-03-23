{ pkgs, home-manager, ... }: {
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  home-manager.users.kyubey = {
    home.packages = with pkgs; [ jellyfin jellyfin-web jellyfin-ffmpeg ];
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      # doesn't build
      # vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime
    ];
  };

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "kyubey";
  };
}
