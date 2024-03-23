{ inputs, pkgs, home-manager, lib, ... }: {
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      survival = {
        enable = true;
        enableReload = true;
        package = pkgs.paperServers.paper-1_20_4;

        jvmOpts =
          "-Xmx4096M -Xms4096M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true";

        serverProperties = {
          motd = "i love girls";
          server-port = 43000;
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
