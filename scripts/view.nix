{ pkgs, ... }:
let
  name = "view";

  devour = "${pkgs.devour}/bin/devour";

  nsxiv = "${pkgs.nsxiv}/bin/nsxiv";
  mpv = "${pkgs.mpv}/bin/mpv";
in pkgs.writeScriptBin name ''
  if [ $# -eq 0 ]; then
    echo "no media specified"
    exit 1
  fi

  ext="''${1##*.}"

  case "$ext" in
  mp4 | mkv | avi | mov | flv | wmv)
    ${devour} ${mpv} "$@"
    ;;
  png | jpg | jpeg | gif)
    ${devour} ${nsxiv} "$@"
    ;;
  *)
    echo "$ext not supported"
    exit 1
    ;;
  esac
''
