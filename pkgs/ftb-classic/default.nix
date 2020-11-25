{ stdenv
, fetchurl
, makeDesktopItem
, makeWrapper
, jre
, libpulseaudio
, libXxf86vm
}:
let
  desktopItem = makeDesktopItem {
    name = "ftb-launcher";
    exec = "ftb-launcher";
    comment = "Classic launcher for FTB";
    desktopName = "FTB Launcher";
    categories = "Game;";
  };

  libPath = stdenv.lib.makeLibraryPath [
    libpulseaudio
    libXxf86vm # Needed only for versions <1.13
  ];
in
  stdenv.mkDerivation rec {
    name = "ftb-classic";

    jar = fetchurl (builtins.fromJSON (builtins.readFile ./source.json));

    dontUnpack = true;

    nativeBuildInputs = [ makeWrapper ];

    installPhase = ''
    mkdir -p $out/bin $out/share/ftb

    makeWrapper ${jre}/bin/java $out/bin/${name} \
      --add-flags "-jar $out/share/ftb/${name}.jar" \
      --suffix LD_LIBRARY_PATH : ${libPath}

    cp $jar $out/share/ftb/${name}.jar
    cp -r ${desktopItem}/share/applications $out/share
    '';

    meta = with stdenv.lib; {
      description = "Classic launcher for FTB";
      homepage = "https://www.feed-the-beast.com/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  }

