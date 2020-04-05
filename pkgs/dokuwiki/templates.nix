{ stdenv, pkgs, fetchFromGitHub }:

{
  bootstrap3 = stdenv.mkDerivation {
    name = "dokuwiki-template-bootstrap3";
    # Download the theme from the dokuwiki site
    src = pkgs.fetchurl {
      url = https://github.com/giterlizzi/dokuwiki-template-bootstrap3/archive/v2019-05-22.zip;
      sha256 = "4de5ff31d54dd61bbccaf092c9e74c1af3a4c53e07aa59f60457a8f00cfb23a6";
    };
    # We need unzip to build this package
    buildInputs = [ pkgs.unzip ];
    # Installing simply means copying all files to the output directory
    installPhase = "mkdir -p $out; cp -R * $out/";
  };
}

