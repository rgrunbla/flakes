{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "neo4j";
  version = "4.3.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1rqa2llhr94w11hkghvxmj2czgqyj0fslrfnrn6kgf5wqdjiliby";
  };

  doCheck = false;
  propagatedBuildInputs = with python3Packages; [ pytz ];

  meta = with lib; {
    homepage = "https://github.com/neo4j/neo4j-python-driver";
    description = "Neo4j Bolt driver for Python.";
    license = licenses.bsd2;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
