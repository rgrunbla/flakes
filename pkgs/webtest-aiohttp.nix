{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "webtest-aiohttp";
  version = "2.0.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1y0izfgrsd8f346rsvndjv81ilfnwhyz1gnf7krg3hvq63qs5qjq";
  };

  propagatedBuildInputs = with python3Packages;  [
    webtest
  ];

  meta = with lib; {
    homepage = "https://github.com/sloria/webtest-aiohttp";
    description = "webtest-aiohttp provides integration of WebTest with aiohttp.web applications";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
