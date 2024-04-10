{ pkgs, ... }:
let
  screenshot = import ./screenshot.nix pkgs;
  fetch = import ./fetch.nix pkgs;
  view = import ./view.nix pkgs;

in [ screenshot fetch view ]
