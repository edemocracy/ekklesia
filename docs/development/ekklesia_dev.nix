{ config, pkgs, ... }:
let
  rwhich = pkgs.writeShellApplication {
    name = "rwhich";
    text = ''
      WHICH=$(which "$1")
      if "$WHICH"; then
          readlink -f "$WHICH"
      else
          echo "$WHICH"
      fi
    '';
  };
in
{
  imports = [ /etc/nixos/cachix.nix ];

  environment.pathsToLink = [
    "/share/nix-direnv"
  ];

  environment.systemPackages = with pkgs; [
    any-nix-shell
    broot
    cachix
    chromium
    config.services.postgresql.package
    delta
    direnv
    fd
    fzf
    git
    httpie
    htop
    glances
    jq
    navi
    nerdfonts
    nix-direnv
    pgcli
    powerline-fonts
    jetbrains.pycharm-community
    rich-cli
    ripgrep
    rwhich
    sd
    socat
    starship
    topgrade
    vim
    vimPlugins.vim-nix
    wrk
    zeal
  ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    extra-experimental-features = nix-command flakes
  '';

  programs.bash.interactiveShellInit = ''
    eval "$(direnv hook bash)"
  '';

  programs.zsh.interactiveShellInit = ''
    eval "$(direnv hook zsh)"
  '';

  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncation_length = 10;
      };
      nix_shell = {
        pure_msg ="pure";
        impure_msg = "";
      };
      shell = {
        disabled = false;
        style = "yellow";
      };
      status = {
        disabled = false;
        map_symbol = true;
        format = "[$symbol $status $common_meaning$signal_name]($style) ";
      };
    };
  };

  programs.tmux = {
      plugins = with pkgs.tmuxPlugins; [
        pain-control
        sensible
      ];
      enable = true;
      baseIndex = 1;
      clock24 = true;
  };

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
  };

  security.sudo.wheelNeedsPassword = false;
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "demo";
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [
      "demo"
      "ekklesia_portal"
      "test_ekklesia_portal"
      "ekklesia_voting"
      "test_ekklesia_voting"
    ];
    ensureUsers = [
      {
        name = "demo";
        ensurePermissions = {
          "DATABASE demo" = "ALL PRIVILEGES";
          "DATABASE ekklesia_portal" = "ALL PRIVILEGES";
          "DATABASE test_ekklesia_portal" = "ALL PRIVILEGES";
          "DATABASE ekklesia_voting" = "ALL PRIVILEGES";
          "DATABASE test_ekklesia_voting" = "ALL PRIVILEGES";
        };
      }
    ];
    # PostgreSQL 15 doesn't work with ensurePermissions correctly, don't upgrade for now.
    package = pkgs.postgresql_14;
  };

  users.defaultUserShell = pkgs.zsh;
}
