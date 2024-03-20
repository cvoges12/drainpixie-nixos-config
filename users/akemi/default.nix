{ pkgs, home-manager, ... }: {
  nix.settings.trusted-users = [ "akemi" ];

  users.users.akemi = {
    uid = 1000;
    home = "/home/akemi";

    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [ "wheel" "audio" "networkmanager" ];
  };

  home-manager.users.akemi = {
    home = {
      stateVersion = "24.05";

      packages = with pkgs; [
        strace
        man-pages
        man-pages-posix

        wget
        curl

        fd
        tokei
        du-dust

        ungoogled-chromium
        alacritty

        zip
        unzip
      ];

      sessionVariables = { } // import ../../common/session.nix;
    };

    programs = { } // import ../../common/bash.nix;
  };
}
