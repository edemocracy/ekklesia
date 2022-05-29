{ sources ? null }:
with builtins;

let
  sources_ = if (sources == null) then import ./sources.nix else sources;
  pkgs = import sources_.nixpkgs { };
  py = pkgs.python310;
  inherit (pkgs) lib niv;
  myst-docutils = py.pkgs.callPackage ./myst-docutils.nix {
  };

  pythonEnv = py.withPackages (ps: with ps; [
    myst-docutils
    graphviz
    sphinx
    sphinx_rtd_theme
  ]);

  tools = with pkgs; [
    niv
    vale
  ];

in {
  inherit pkgs pythonEnv tools;
}
