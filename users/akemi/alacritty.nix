{ pkgs, home-manager, ... }:
let my = import ../../common/colours.nix;
in {
  home-manager.users.akemi.programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 16;
        y = 16;
      };

      colors.primary = my.colors.primary;
      colors.normal = my.colors.normal;
      colors.bright = my.colors.bright;

      font = {
	normal.family = "tewi";
	bold.family = "tewi";
	italic.family = "tewi";
	bold_italic.family = "tewi";
      };
    };
  };
}
