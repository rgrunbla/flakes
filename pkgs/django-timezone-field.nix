{ stdenv, lib, python3Packages }:

python3Packages.buildPythonPackage
rec {
  pname = "django-timezone-field";
  version = "4.1.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-z/rGJFLQYONlk4qpyfe3LXDYsmucYCQ7ziJ7NavRud8=";
  };

  doCheck = false;
  propagatedBuildInputs = with python3Packages; [ django_3 ];

  meta = with lib; {
    homepage = "https://github.com/mfogel/django-timezone-field/";
    description = "A Django app providing database, form and serializer fields for pytz timezone objects.";
    license = licenses.bsd2;
    maintainers = with maintainers; [ rgrunbla ];
  };
}