let pkgs    = import <nixpkgs> { inherit config; };

    config  = {
      allowUnfree = true;
      packageOverrides = pkgs: rec {
          bind = callPackage ./derivations/bind { }; #bind with disabled openssl
      };
    };

    callPackage = pkgs.lib.callPackageWith (pkgs // self );

    self = rec {
      inherit pkgs;
      dnsperf     = callPackage        ./derivations/dnsperf.nix         {};
    };
in self

