{ fetchgitPrivate, stdenv , autoreconfHook, bind, openssl, libcap, libkrb5, libxml2, geoip }:

stdenv.mkDerivation {
  name = "dnsperf-0.0.1";
  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ openssl bind libcap libkrb5 libxml2 geoip ];
  src = fetchgitPrivate {
    url = https://github.com/drchaos/dnsperf-tcp;
    rev = "1ef861d71581c45de6262a71aedbf93f8a3adb92";
    sha256 = "1sb8nwn1h2vkyf319z89azgrahig324yvwj0whyxlg3gwinafppf";
  };
}
