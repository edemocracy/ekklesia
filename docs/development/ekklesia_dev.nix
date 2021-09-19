{ config, pkgs, ... }:
{
  imports = [ ./cachix.nix ];

  environment.systemPackages = with pkgs; [
    cachix
    config.services.postgresql.package
    direnv
    git
    jq
    nix-direnv
    pgcli
  ];
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];
  servies.postgresql = {
    enable = true;
    ensureDatabases = [
      "ekklesia_portal"
      #"ekklesia_voting" # add additional databases like this
    ];
    ensureUsers = [
      {
        name = "demo";
        ensurePermissions = {
          "DATABASE ekklesia_portal" = "ALL PRIVILEGES";
          #"DATABASE ekklesia_voting" = "ALL PRIVILEGES";
        };
      }
    ];
    package = pkgs.postgresql_13;
  };
}