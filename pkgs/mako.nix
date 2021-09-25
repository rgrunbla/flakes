{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "Mako";
  version = "1.1.4";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1aymx6gwks2hggmz4f4wmkpajnqx7jywnaxfzz017hw7f05iz0qp";
  };

  propagatedBuildInputs = with python3Packages;  [ markupsafe ];

  meta = with lib; {
    homepage = "https://www.makotemplates.org/";
    description = "A super-fast templating language that borrows the best ideas from the existing templating languages.";
    license = licenses.mit;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
