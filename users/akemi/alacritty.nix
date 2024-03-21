{ pkgs, home-manager, ... }: {
  home-manager.users.akemi.programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 16;
        y = 16;
      };

      colors.primary = {
        background = "0xfaf8fc";
        foreground = "0x4b455f";
      };

      colors.normal = {
        black = "0x201d2a";
        red = "0x9375f5";
        green = "0xd294ff";
        yellow = "0xecd1ff";
        blue = "0xa286fd";
        magenta = "0xc16bff";
        cyan = "0xb5a0fe";
        white = "0x9992b0";
      };

      colors.bright = {
        black = "0x625a7c";
        red = "0xdba8ff";
        green = "0x2c2839";
        yellow = "0x4b455f";
        blue = "0x6e658b";
        magenta = "0xdcd2fe";
        cyan = "0xca80ff";
        white = "0xfaf8fc";
      };
    };
  };
}
