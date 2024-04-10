{ pkgs, ... }:

let
  name = "fetch";
  c0 = "\\033[1;0m";
  c1 = "\\033[1;31m";
  c2 = "\\033[1;32m";
  c3 = "\\033[1;33m";
  c4 = "\\033[1;34m";
  c5 = "\\033[1;35m";
in pkgs.writeScriptBin name ''
  function clean {
    tput cnorm
  }

  tput civis
  trap clean EXIT

  pm="$(nix-store -qR /run/current-system/sw | wc -l)"
  up="$(awk '{print int($1 / 3600)}' /proc/uptime)"
  at="$(uname -n)"
  me="$(whoami)"
  sh="$(basename $SHELL)"

  echo
  echo -e "${c1}@     ${c1}...    ''${at}${c0}"
  echo -e "${c2}me    ${c2}...    ''${me}${c0}"
  echo -e "${c3}sh    ${c3}...    ''${sh}${c0}"
  echo -e "${c4}up    ${c5}...    ''${up}h${c0}"
  echo -e "${c5}pm    ${c4}...    ''${pm}${c0}"
  echo

  read -s -n 1
''
