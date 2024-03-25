{ pkgs, ... }: {
  services.borgbackup.jobs = let
    host = "ps1z8340@ps1z8340.repo.borgbase.com:repo";

    basicBorgJob = name: {
      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat /home/kyubey/borg/passphrase";
      };

      environment.BORG_RSH =
        "ssh -o 'StrictHostKeyChecking=no' -i /home/kyubey/borg/borgbase";

      repo = "${host}/${name}";
      compression = "auto,lzma";
      startAt = "daily";
      persistentTimer = true;
    };
  in {
    minecraft = basicBorgJob "minecraft/girltits" // rec {
      paths = "/srv/minecraft/girltits";
      exclude = map (x: paths + "/" + x) [ "libraries" "versions" "mods" ];
    };
  };
}
