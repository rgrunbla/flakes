{ stdenv, lib, python3Packages, django-timezone-field }:

python3Packages.buildPythonPackage
rec {
  pname = "django-celery-beat";
  version = "2.2.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-l65eswlUFVG9sHv2DMV8raz0KnQodWDO0tLAYphiAjQ=";
  };
  doCheck = false;
  buildInputs =
    with python3Packages;
    [
      django_3
      celery
      python-crontab
      django-timezone-field
    ];

  meta = with lib; {
    homepage = "https://github.com/celery/django-celery-beat";
    description = "Database-backed Periodic Tasks";
    license = licenses.bsd3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
