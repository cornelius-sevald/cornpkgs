{ laptop ? true, stdenv, fetchgit, libX11 }:

let
  pname = "dwmstatus";
  version = "1.0-corn";
in stdenv.mkDerivation {
  inherit pname version;

  src = if laptop
        then fetchgit (builtins.fromJSON (builtins.readFile ./source_laptop.json))
        else fetchgit (builtins.fromJSON (builtins.readFile ./source_desktop.json));
  buildInputs = [ libX11 ];

  installPhase = ''
    make install PREFIX=$out
  '';

  meta = {
    homepage = "https://suckless.org/";
    description = "Barebones status monitor for dwm";
    license = stdenv.lib.licenses.mit;
    platforms = with stdenv.lib.platforms; all;
  };
}
