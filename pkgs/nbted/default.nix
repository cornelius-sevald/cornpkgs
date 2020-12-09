{ stdenv
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "nbted";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "C4K3";
    repo = pname;
    rev = version;
    sha256 = "07l4ij88zavvw317hh57fp0gwpl36s18nzg1yz161pf8b16b2076";
  };

  cargoSha256 = "05qlxdvjz4hwy7nqw6zhlvzb2ds08hbyg5pwq4c3rk7pdic4ylzp";

  meta = with stdenv.lib; {
    description = "Command-line NBT editor written in Rust.";
    homepage = "https://github.com/C4K3/nbted";
    license = licenses.cc0;
  };
}

