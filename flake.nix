{
  description = " A collection of various NixOS packages in a single tree ";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
  };

  outputs = { self, nixpkgs }:
    with import nixpkgs { system = "x86_64-linux"; };
    {
      packages.x86_64-linux.neo4j = callPackage ./pkgs/neo4j.nix { };
      packages.x86_64-linux.libad9361-iio = callPackage ./pkgs/libad9361-iio.nix { };
      packages.x86_64-linux.attrs-strict = callPackage ./pkgs/attrs-strict.nix { };
      packages.x86_64-linux.swh-model = callPackage ./pkgs/swh-model.nix {
        attrs-strict = self.packages.x86_64-linux.attrs-strict;
      };
      # Django 
      packages.x86_64-linux.django-timezone-field = callPackage ./pkgs/django-timezone-field.nix { };
      packages.x86_64-linux.django-celery-beat = callPackage ./pkgs/django-celery-beat.nix { django-timezone-field = self.packages.x86_64-linux.django-timezone-field; };

      lib = {
        fetchSWH = callPackage ./pkgs/fetchSWH.nix { };
      };
    };
}
