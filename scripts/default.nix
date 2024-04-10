{ pkgs, ... }:
let
  screenshot = import ./screenshot.nix pkgs;
  fetch = import ./fetch.nix pkgs;

in [ screenshot fetch ]
