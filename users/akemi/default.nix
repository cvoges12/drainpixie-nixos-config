{ pkgs, home-manager, inputs, ... }: {
  nix.settings.trusted-users = [ "akemi" ];

  imports = [ ./desktop.nix ./alacritty.nix ];

  services.tailscale.enable = true;

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

      packages = with pkgs;
        [
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
        ] ++ (import ../../scripts { inherit pkgs; });

      sessionVariables = { } // import ../../common/session.nix;
    };

    xdg = {
      userDirs = {
        enable = true;

        music = "$HOME/msc";
        desktop = "$HOME/dsk";
        download = "$HOME/dwl";
        pictures = "$HOME/img";
        documents = "$HOME/doc";
      };
    };

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true;
      };
    } // import ../../common/bash.nix;

    services.arrpc.enable = true;
  };
}
