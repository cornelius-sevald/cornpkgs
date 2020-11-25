{ stdenv
, fetchurl
, makeDesktopItem
, makeWrapper
, jre
}:
let
  desktopItem = makeDesktopItem {
    name = "ftb-launcher";
    exec = "ftb-launcher";
    comment = "Classic launcher for FTB";
    desktopName = "FTB Launcher";
    categories = "Game;";
  };
in
  stdenv.mkDerivation rec {
    name = "ftb-classic";

    jar = fetchurl (builtins.fromJSON (builtins.readFile ./source.json));

    dontUnpack = true;

    nativeBuildInputs = [ makeWrapper ];

    installPhase = ''
      mkdir -pv $out/share/java $out/bin
      cp ${jar} $out/share/java/${name}.jar

      makeWrapper ${jre}/bin/java $out/bin/${name} \
        --add-flags "-jar $out/share/java/${name}.jar" \
        --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on' \
        --set _JAVA_AWT_WM_NONREPARENTING 1
    '';

    meta = with stdenv.lib; {
      description = "Classic launcher for FTB";
      homepage = "https://www.feed-the-beast.com/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  }

