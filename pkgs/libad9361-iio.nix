{ stdenv, lib, fetchFromGitHub, cmake, libiio }:

stdenv.mkDerivation
rec {
  pname = "libad9361-iio";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "analogdevicesinc";
    repo = pname;
    rev = "refs/tags/v${version}";
    sha256 = "sha256-dYoFWRnREvlOC514ZpmmvoS37DmIkVqfq7JPpTXqXd8=";
  };

  buildInputs = [
    libiio
    cmake
  ];


  meta = with lib; {
    homepage = "https://github.com/analogdevicesinc/libad9361-iio";
    description = "IIO AD9361 library for filter design and handling, multi-chip sync, etc.";
    license = licenses.lgpl2;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
