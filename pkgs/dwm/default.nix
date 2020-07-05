{ stdenv, fetchgit, libX11, libXinerama, libXft }:

let
  pname = "dwm";
  version = "6.2-corn";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));
  buildInputs = [ libX11 libXinerama libXft ];

  installPhase = ''
    make install PREFIX=$out
  '';

  meta = {
    homepage = "https://suckless.org/";
    description = "Dynamic window manager for X";
    license = stdenv.lib.licenses.mit;
    platforms = with stdenv.lib.platforms; all;
  };
}
