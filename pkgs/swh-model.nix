{ stdenv, lib, python3Packages, attrs-strict }:

python3Packages.buildPythonPackage
rec {
  pname = "swh.model";
  version = "2.8.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0g1crlfv10f994jkz0bm3cv5kgwvr0a07m7h2810xyg2ikvszgxk";
  };

  propagatedBuildInputs = with python3Packages; [
    setuptools
    setuptools_scm
    attrs
    iso8601
    dateutil
    click
    pytest
    dulwich
    pytz
    typing-extensions
    deprecated
    hypothesis
    attrs-strict
  ];

  meta = with lib; {
    homepage = "https://forge.softwareheritage.org/source/swh-model/";
    description = "Neo4j Bolt driver for Python.";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
