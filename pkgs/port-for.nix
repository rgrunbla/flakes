{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "port-for";
  version = "0.6.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1r7nb4lhn366gyc9fm53465xkxj8ldb2mzyir564sqcc2fyfspda";
  };

  propagatedBuildInputs = with python3Packages;  [ ];

  meta = with lib; {
    homepage = "https://github.com/kmike/port-for/";
    description = "Utility that helps with local TCP ports management. It can find an unused TCP localhost port and remember the association.";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
