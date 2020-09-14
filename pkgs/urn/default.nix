{ stdenv, fetchgit
, pkgconfig, wrapGAppsHook
, xxd, rsync, imagemagick
, glib, gsettings_desktop_schemas, gtk
, jansson
}:

let
  pname = "urn";
  version = "1.0c1.0";
in stdenv.mkDerivation {
  inherit pname version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

  nativeBuildInputs = [ pkgconfig wrapGAppsHook ];
  buildInputs = [ 
    # Needed for Makefile
    xxd rsync imagemagick
    # Needed for GSETTINGS_SCHEMAS_PATH
    gsettings_desktop_schemas glib gtk
    # Other dependencies
    jansson
  ];

  makeFlags = [
    "PREFIX=${placeholder "out"}"
  ];

  meta = {
    homepage = "https://github.com/cornelius-sevald/urn";
    description = "Simple split tracker hacked together by 3snow p7im.";
    license = stdenv.lib.licenses.gpl3;
  };
}
