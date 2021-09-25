{ stdenv, lib, python3Packages, swh-core, dash-bootstrap-components, swh-model }:

python3Packages.buildPythonPackage
rec {
  pname = "swh.scanner";
  version = "0.4.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1ih19wlr0cnkpj3qzw4i014j8pdan756ldi6q2c6aryw493xccvc";
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
    swh-core
    plotly
    dash
    ndjson
    dash-bootstrap-components
    pandas
    swh-model
    aiohttp
  ];

  meta = with lib; {
    homepage = "https://forge.softwareheritage.org/source/swh-scanner/";
    description = "Neo4j Bolt driver for Python.";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
