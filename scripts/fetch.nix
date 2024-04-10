{ pkgs, ... }:

let
  name = "fetch";

  sh = builtins.path.basename (pkgs.which pkgs.${pkgs.bash} /bin/bash);
  up = toString (builtins.div (builtins.readFile /proc/uptime) 3600);
  at = builtins.readFile /etc/hostname;
  me = builtins.getCurrentUsername;

  # Getting window manager name
  id = pkgs.xorg.xprop "-root" "-notype" "_NET_SUPPORTING_WM_CHECK";
  idTrimmed = builtins.substring 30 (builtins.stringLength id - 2) id;
  wm =
    pkgs.xorg.xprop "-id" idTrimmed "-notype" "-len" "100" "-f" "_NET_WM_NAME"
    "8t";
  wmTrimmed = builtins.substring 24 (builtins.stringLength wm - 3) wm;

  # Counting installed packages (using a simple directory listing)
  pm = builtins.toString
    (builtins.length (builtins.readDir /nix/var/nix/profiles/per-user));

  # Color codes
  c0 = "x1b[0m";
  c1 = "x1b[31m";
  c2 = "x1b[32m";
  c3 = "x1b[33m";
  c4 = "x1b[34m";
  c5 = "x1b[35m";
  c6 = "x1b[36m";

in pkgs.writeScriptBin name ''
  echo "''${c1}@      ''${c1}...    ''${at}''${c0}"
  echo "''${c2}me     ''${c2}...    ''${me}''${c0}"
  echo "''${c3}sh     ''${c3}...    ''${sh}''${c0}"
  echo "''${c4}wm     ''${c4}...    ''${wmTrimmed}''${c0}"
  echo "''${c5}up     ''${c5}...    ''${up}h''${c0}"
  echo "''${c6}pm     ''${c6}...    ''${pm}''${c0}"
''

