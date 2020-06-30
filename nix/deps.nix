{ sources ? null }:
with builtins;

let
  sources_ = if (sources == null) then import ./sources.nix else sources;
  pkgs = import sources_.nixpkgs { };
  niv = (import sources_.niv { }).niv;
  inherit (pkgs) lib;

  pythonEnv = pkgs.python38.withPackages (ps: with ps; [
    graphviz
    sphinx
    sphinx_rtd_theme ]);

in {
  inherit niv pkgs pythonEnv;
}
