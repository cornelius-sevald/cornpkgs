{ stdenv, fetchgit
, xxd, rsync, imagemagick, pkgconfig
, gtk3-x11, jansson
}:

let
  pname = "urn";
  version = "1.0c0.0";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));
  buildInputs = [ xxd rsync imagemagick pkgconfig gtk3-x11 jansson ];

  makeFlags = [
    "PREFIX=${placeholder "out"}"
  ];

  meta = {
    homepage = "https://github.com/cornelius-sevald/urn";
    description = "Simple split tracker hacked together by 3snow p7im.";
    license = stdenv.lib.licenses.gpl3;
  };
}
