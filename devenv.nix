# This project uses devenv to provide a shell which has everything that is needed
# to build the Ekklesa documentation.
# See https://devenv.sh/ for details on how this works.
{ pkgs, config, ... }:

let
  py = config.languages.python.package;
  pythonEnv = py.withPackages (ps: with ps; [
    myst-docutils
    sphinx
    sphinx_rtd_theme
  ]);

in
{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    graphviz
    pythonEnv
  ];

  enterShell = ''
    echo "HELP: Run `make html` to build the documentation."
  '';

  languages.python.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
