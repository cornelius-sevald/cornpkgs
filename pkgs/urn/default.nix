{ stdenv, fetchgit, pkgconfig, rsync, xxd, imagemagick, libX11, gtk3, jansson }:

let
  pname = "urn";
  version = "0";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

  nativeBuildInputs = [ pkgconfig rsync xxd imagemagick ];
  buildInputs = [ libX11 gtk3 jansson ];

  installPhase = ''
    mkdir -p $out/bin

    make install PREFIX=$out SHARE=~/.local/share
    '';

  meta = {
    homepage = "https://github.com/3snowp7im/urn";
    description = "Simple split tracker";
    license = stdenv.lib.licenses.gpl3;
  };
}
