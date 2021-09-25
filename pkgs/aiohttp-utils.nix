{ stdenv, lib, python3Packages, python-mimeparse, webtest-aiohttp }:

python3Packages.buildPythonPackage
rec {
  pname = "aiohttp_utils";
  version = "3.1.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "056w0aw3nnnhwzrn8rrsn7hbmxb5yd7iz8h4m4x1kzd32pfc9wh8";
  };

  propagatedBuildInputs = with python3Packages;  [
    psutil
    aiohttp
    gunicorn
    python-mimeparse
    pytest
    webtest-aiohttp
    Mako
  ];

  meta = with lib; {
    homepage = "https://github.com/sloria/aiohttp_utils";
    description = "Handy utilities for aiohttp.web applications.";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
