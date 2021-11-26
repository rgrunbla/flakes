{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "kconfiglib";
  version = "14.1.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-vtLMIhb1OOykJVqDpFiNiCNWPN1QEU+GzxomdOYCyTw=";
  };

  propagatedBuildInputs = with python3Packages;  [
  ];

  meta = with lib; {
    homepage = "https://github.com/ulfalizer/Kconfiglib";
    description = "A flexible Python Kconfig implementation";
    license = licenses.isc;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
