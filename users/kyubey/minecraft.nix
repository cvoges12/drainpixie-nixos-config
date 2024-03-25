{ inputs, pkgs, home-manager, lib, ... }:
let
  modpack = pkgs.fetchPackwizModpack {
    url =
      "https://raw.githubusercontent.com/packwiz/packwiz-example-pack/v1/pack.toml";
    packHash = "mQFjhQg4gyz+IlWNmjQbAqLAw1WMLsxF1u9HqtYi2Y8=";
  };

  minecraftVersion = modpack.manifest.versions.minecraft;
  quiltVersion = modpack.manifest.versions.quilt;
  serverVersion =
    lib.replaceStrings [ "." ] [ "_" ] "quilt-${minecraftVersion}";
in {
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    eula = true;
    enable = true;
    openFirewall = true;

    servers = {
      girltits = {
        enable = true;
        autoStart = true;
        enableReload = true;
        openFirewall = true;

        package = pkgs.quiltServers.${serverVersion}.override {
          loaderVersion = quiltVersion;
        };
        symlinks = { "mods" = "${modpack}/mods"; };

        jvmOpts =
          "-XX:+UseG1GC -Xmx4G -Xms4G -Dsun.rmi.dgc.server.gcInterval=600000 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32";

        serverProperties = {
          motd = "we love gitties";
          online-mode = true;
          max-players = 5;

          difficulty = "normal";
          gamemode = "survival";
          view-distance = 8;
          simulation-distance = 8;
          spawn-protection = 5;
        };
      };
    };
  };

}
