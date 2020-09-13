{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  myOcamlPackages = ocaml-ng.ocamlPackages_4_07;
in
  myOcamlPackages.buildDunePackage {
    pname = "color";
    version = "0.2.0";
    src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));
    buildInputs = with myOcamlPackages; [
      core dune alcotest gg
    ];
  }
