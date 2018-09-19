let pkgs    = import <nixpkgs> { inherit config; };

    config  = {
      allowUnfree = true;
      #packageOverrides = pkgs: rec {
          #openssl = pkgs.openssl_1_1_0;
          #openssl = pkgs.lib.meta.addMetaAttrs  { outputsToInstall = "dev"; } pkgs.openssl;
      #};
    };

    callPackage = pkgs.lib.callPackageWith (pkgs // self );

    self = rec {
      inherit pkgs;
      dnsperf     = callPackage        ./dnsperf.nix         { };
    };
in self

