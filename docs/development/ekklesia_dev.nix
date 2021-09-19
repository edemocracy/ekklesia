{ config, pkgs, ... }:
{
  imports = [ ./cachix.nix ];

  environment.pathsToLink = [
    "/share/nix-direnv"
  ];

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

  programs.bash.interactiveShellInit = ''
    eval "$(direnv hook bash)"
  '';

  services.postgresql = {
    enable = true;
    ensureDatabases = [
      "demo"
      "ekklesia_portal"
      #"ekklesia_voting" # add additional databases like this
    ];
    ensureUsers = [
      {
        name = "demo";
        ensurePermissions = {
          "DATABASE demo" = "ALL PRIVILEGES";
          "DATABASE ekklesia_portal" = "ALL PRIVILEGES";
          #"DATABASE ekklesia_voting" = "ALL PRIVILEGES";
        };
      }
    ];
    package = pkgs.postgresql_13;
  };
}
