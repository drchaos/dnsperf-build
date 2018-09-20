{ fetchgit, stdenv , autoreconfHook, pkgconfig, bind, openssl, libcap, libkrb5, libxml2, geoip }:

stdenv.mkDerivation {
  name = "dnsperf-0.0.1";
  nativeBuildInputs = [ autoreconfHook pkgconfig ];
  buildEnv = [openssl];
  buildInputs = [ openssl bind libcap libkrb5 libxml2 geoip ];
  #src = ../../dnsperf-tcpc;
  src = fetchgit {
    url = https://github.com/drchaos/dnsperf-tcp;
    rev = "39d704daf8fe8a2c152988ecf5b65cebdfa3a01a";
    sha256 = "1cnj76z4fz18s3267c55861fzjqrcsz3ddgmnh141nwd94dhxzzc";
  };
}
