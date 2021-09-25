{ stdenv, lib, coreutils, unzip, jq, zip, fetchurl, writeScript, ... }:

{ swhid
, name ? "source"
, cook ? true
, swh_domain ? "archive.softwareheritage.org"
, swh_api_version ? "1"
, ...
}@args:

with lib;

let
  baseUrl = "https://${swh_domain}/api/${swh_api_version}/vault/directory/${swhid}";
  url = "${baseUrl}/raw";
  basename = baseNameOf url;
in

(fetchurl ({
  inherit name;
  inherit url;

  recursiveHash = true;

  downloadToTemp = true;

  postFetch =
    ''
      unpackDir="$TMPDIR/unpack"
      mkdir "$unpackDir"
      cd "$unpackDir"
      renamed="$TMPDIR/${basename}.tar.gz"
      mv "$downloadedFile" "$renamed"
      unpackFile "$renamed"
      if [ $(ls "$unpackDir" | wc -l) != 1 ]; then
        echo "error: zip file must contain a single file or directory."
        echo "hint: Pass stripRoot=false; to fetchzip to assume flat list of files."
        exit 1
      fi
      fn=$(cd "$unpackDir" && echo *)
      if [ -f "$unpackDir/$fn" ]; then
        mkdir $out
      fi
      mv "$unpackDir/$fn" "$out"
    ''
    # Remove non-owner write permissions
    # Fixes https://github.com/NixOS/nixpkgs/issues/38649
    + ''
      chmod 755 "$out"
    '';
} // removeAttrs args [ "swhid" "stripRoot" "extraPostFetch" ])).overrideAttrs (x: {
  # Hackety-hack: we actually need unzip hooks, too
  nativeBuildInputs = x.nativeBuildInputs ++ [ unzip ];
})
