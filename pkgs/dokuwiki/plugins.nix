{ stdenv, pkgs, fetchFromGitHub }:
{
  icalevents = stdenv.mkDerivation {
    name = "icalevents";
    # Download the plugin from the dokuwiki site
    src = pkgs.fetchurl {
      url = https://github.com/real-or-random/dokuwiki-plugin-icalevents/releases/download/2017-06-16/dokuwiki-plugin-icalevents-2017-06-16.zip;
      sha256 = "e40ed7dd6bbe7fe3363bbbecb4de481d5e42385b5a0f62f6a6ce6bf3a1f9dfa8";
    };
    # We need unzip to build this package
    buildInputs = [ pkgs.unzip ];
    sourceRoot = ".";
    # Installing simply means copying all files to the output directory
    installPhase = "mkdir -p $out; cp -R * $out/";
  };
}
