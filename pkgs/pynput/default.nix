{ stdenv, python }:

let setuptools-lint = with python.pkgs; buildPythonPackage rec {
  pname = "setuptools-lint";
  version = "0.6.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "16a1ac5n7k7sx15cnk03gw3fmslab3a7m74dc45rgpldgiff3577";
  };

  propagatedBuildInputs = [ pylint ];

  meta = with stdenv.lib; {
    description = "Package to expose pylint as a lint command into setup.py";
    homepage = "https://github.com/johnnoone/setuptools-pylint";
    license = licenses.bsdOriginal;
  };
};
in
  with python.pkgs; buildPythonPackage rec {
    pname = "pynput";
    version = "1.6.8";

    src = fetchPypi {
      inherit pname version;
      sha256 = "16h4wn7f54rw30jrya7rmqkx3f51pxn8cplid95v880md8yqdhb8";
    };

    nativeBuildInputs = [ sphinx ];

    propagatedBuildInputs = [ setuptools-lint xlib ];

    doCheck = false;

    meta = with stdenv.lib; {
      description = "A library to control and monitor input devices";
      homepage = "https://github.com/moses-palmer/pynput";
      license = licenses.lgpl3;
    };
  }
