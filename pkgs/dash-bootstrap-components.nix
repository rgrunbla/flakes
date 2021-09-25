{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "dash-bootstrap-components";
  version = "0.13.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "137jjvirqa0pfpby147bkayv5w2xphyfb89k0a5lc892wrjgbfvf";
  };

  propagatedBuildInputs = with python3Packages;  [ dash ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://dash-bootstrap-components.opensource.faculty.ai/";
    description = "Bootstrap themed components for use in Plotly Dash";
    license = licenses.asl20;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
