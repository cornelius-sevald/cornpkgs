{ stdenv
, fetchurl
}:

let
  pname = "polyglot";
  version = "2.0.4";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "http://deb.debian.org/debian/pool/main/p/${pname}/${pname}_${version}.orig.tar.gz";
    sha256 = "0gfjwcrrda5sald02c4vl618c73y90ggzls9cscdyswmgw6zhhzs";
  };
  buildInputs = [];

  meta = {
    homepage = "https://packages.debian.org/buster/polyglot";
    description = "Chess engine protocol adaptor, connects UCI engines to xboard";
    license = stdenv.lib.licenses.gpl2;
  };
}
