{ pkgs, ... }:
let
  name = "screenshot";

  xclip = "${pkgs.xclip}/bin/xclip";
  maim = "${pkgs.maim}/bin/maim";
in pkgs.writeScriptBin name ''
  ${maim} -m 10 -s | ${xclip} -selection clipboard -t image/png
''
