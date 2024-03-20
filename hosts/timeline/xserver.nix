_: {
  services.xserver = {
    enable = true;

    windowManager."2bwm".enable = true;

    displayManager = {
      lightdm.enable = true;

      autoLogin.enable = true;
      autoLogin.user = "akemi";
    };
  };
}
