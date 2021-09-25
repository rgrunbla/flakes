{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "python-mimeparse";
  version = "1.6.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0y2g6cl660bpz11srgqyvvm8gmywpgyx8g0xfvbiyr0af0yv1r3n";
  };

  propagatedBuildInputs = with python3Packages;  [
  ];

  meta = with lib; {
    homepage = "https://github.com/dbtsai/python-mimeparse";
    description = "A module provides basic functions for parsing mime-type names and matching them against a list of media-ranges.";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
