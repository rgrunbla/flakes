{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "mirakuru";
  version = "2.4.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "02ydn1cfp6s7a9h9vj1rg1wbmsv03m9kjcmfsrxrakphs8hx29bh";
  };

  propagatedBuildInputs = with python3Packages;  [ psutil ];

  meta = with lib; {
    homepage = "https://github.com/ClearcodeHQ/mirakuru";
    description = "Process executor (not only) for tests.";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
