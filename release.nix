let pkgs    = import <nixpkgs> { inherit config; };

    config  = {
      allowUnfree = true;
      packageOverrides = pkgs: rec {
          #openssl = pkgs.lib.meta.addMetaAttrs  { outputsToInstall = "dev"; } pkgs.openssl;
          bind = callPackage ./derivations/bind { }; #bind with disabled openssl
      };
    };

    callPackage = pkgs.lib.callPackageWith (pkgs // self );

    self = rec {
      inherit pkgs;
      dnsperf     = callPackage        ./derivations/dnsperf.nix         { openssl = pkgs.openssl_1_1_0; };
    };
in self

