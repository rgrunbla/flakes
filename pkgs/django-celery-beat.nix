{ stdenv, lib, pkgs, python3Packages }:

let
  my_python = pkgs.python3.override {
    packageOverrides = self: super: {
      django = super.django_3;
    };
  };
in
python3Packages.buildPythonPackage rec {
  pname = "django-celery-beat";
  version = "2.2.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-l65eswlUFVG9sHv2DMV8raz0KnQodWDO0tLAYphiAjQ=";
  };

  propagatedBuildInputs = with my_python.pkgs; [
    django
    celery
    python-crontab
    django-timezone-field
  ];

  doCheck = false;
  buildInputs = with my_python.pkgs; [ ephem pytest-timeout pytest_4 ];

  meta = with lib; {
    homepage = "https://github.com/celery/django-celery-beat";
    description = "Database-backed Periodic Tasks";
    license = licenses.bsd3;
    maintainers = with maintainers; [ rgrunbla ];
  };
}
