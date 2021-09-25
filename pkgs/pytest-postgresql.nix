{ stdenv, lib, python3Packages, port-for, mirakuru }:

python3Packages.buildPythonPackage
rec {
  pname = "pytest-postgresql";
  version = "3.1.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0i7nidq0rwnshdvgwjgfvnj2b6g5bxb2rcsh7a9wmxqx3j6m945n";
  };

  propagatedBuildInputs = with python3Packages; [ pytest port-for mirakuru ];

  meta = with lib; {
    homepage = "https://github.com/ClearcodeHQ/pytest-postgresql";
    description = "attrs runtime validation";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
