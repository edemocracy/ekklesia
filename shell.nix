{ sources ? null }:
let
  deps = import ./nix/deps.nix { inherit sources; };
  inherit (deps) niv pythonEnv pkgs;
  caBundle = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";

in
pkgs.mkShell {
  name = "ekklesia-dev-env";
  buildInputs = [
    niv
    pythonEnv
  ];

  shellHook = ''
    export NIX_SSL_CERT_FILE=${caBundle}
    export SSL_CERT_FILE=${caBundle}
  '';
}
