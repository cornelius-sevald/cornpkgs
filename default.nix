# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {}, laptop ? false }:

rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  python = pkgs.python38;

  dwm = pkgs.callPackage ./pkgs/dwm { };
  dwmstatus = pkgs.callPackage ./pkgs/dwmstatus { inherit laptop; };
  st = pkgs.callPackage ./pkgs/st { };
  pynput = pkgs.callPackage ./pkgs/pynput { inherit python; };
  color = pkgs.callPackage ./pkgs/color { };
  flitter = pkgs.callPackage ./pkgs/flitter { inherit color; };
  urn = pkgs.callPackage ./pkgs/urn { gtk=pkgs.gtk3; };
  ftb-classic = pkgs.callPackage ./pkgs/ftb-classic { };
  nbted = pkgs.callPackage ./pkgs/nbted { };
  polyglot = pkgs.callPackage ./pkgs/polyglot { };
}

