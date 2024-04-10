{ pkgs, home-manager, inputs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      _2bwm = super._2bwm.overrideAttrs (_: {
        src = inputs._2bwm;
        patches = [ ../../patches/2bwm.diff ];
      });
    })
  ];

  home-manager.users.akemi = {
    home = { packages = with pkgs; [ rofi slock cozette tewi-font ]; };
  };

  # `slock` needs to disable OOM killer, for some reason.
  security.wrappers = {
    slock = {
      setuid = true;

      owner = "root";
      group = "root";

      source = "${pkgs.slock}/bin/slock";
    };
  };
}
