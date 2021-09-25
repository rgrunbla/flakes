{ stdenv, lib, python3Packages, pytest-postgresql, aiohttp-utils }:

python3Packages.buildPythonPackage
rec {
  pname = "swh.core";
  version = "0.14.4";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1iszsyrh2wrmbspfhda37fhy763anngxq8p1vsxk0b6p9g430403";
  };

  propagatedBuildInputs = with python3Packages; [
    setuptools
    setuptools_scm
    attrs
    iso8601
    dateutil
    click
    pytest
    sentry-sdk
    pyyaml
    systemd
    psycopg2
    pytest-postgresql
    flask
    msgpack
    aiohttp
    aiohttp-utils
    requests
    dulwich
    pytz
    typing-extensions
    deprecated
    hypothesis
  ];

  meta = with lib; {
    homepage = "https://forge.softwareheritage.org/source/swh-core/";
    description = "Neo4j Bolt driver for Python.";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
