{ pkgs ? import <nixpkgs> { }, color }:
with pkgs;
let
  myOcamlPackages = ocaml-ng.ocamlPackages_4_07;
in
  myOcamlPackages.buildDunePackage {
    pname = "flitter";
    version = "0.0.1";
    src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));
    buildInputs = with myOcamlPackages; [
      core dune alcotest gg color lwt_ppx re sexp_pretty notty
    ];
  }
