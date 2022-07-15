{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "kaleido";
  version = "0.2.1";
  format = "wheel";

  src = python3Packages.fetchPypi {
    inherit pname version;
    format = "wheel";
    platform = "manylinux1_x86_64";
    sha256 = "sha256-qiHPG/HHj4+lCp99ReEAPDh709b+CnZ8+780S5W9w6g=";
  };
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/plotly/Kaleido";
    description = "Fast static image export for web-based visualization libraries with zero dependencies";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
