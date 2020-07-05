{ stdenv, fetchgit, libX11, pkgconfig, ncurses, libXft }:

with stdenv.lib;

let
  pname = "st";
  version = "0.8.4-corn";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));
  nativeBuildInputs = [ pkgconfig ncurses ];
  buildInputs = [ libX11 libXft ];

  installPhase = ''
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  '';

  meta = {
    homepage = "https://suckless.org/";
    description = "Simple Terminal";
    license = licenses.mit;
    platforms = with stdenv.lib.platforms; all;
  };
}
