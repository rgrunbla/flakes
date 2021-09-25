{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "attrs_strict";
  version = "0.2.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-l09XOJvPr6TFyd7RhQ8orPu8togSvgnb0cMGByidFRk=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs setuptools_scm ];

  meta = with lib; {
    homepage = "https://github.com/bloomberg/attrs-strict";
    description = "attrs runtime validation";
    license = licenses.bsd2;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
