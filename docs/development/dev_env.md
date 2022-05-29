(dev-env)=

# Development Environment

:::{note}
To get an overview on how to set up a development environment, please read {ref}`quickstart`
or see {ref}`dev-nixos-virtualbox` to learn how to set up a NixOS development VM from start to finish.
:::

To get a consistent development environment, we use
[Nix](https://nixos.org/nix) to install Python and the project
dependencies. The development environment also includes PostgreSQL,
linters, a SASS compiler and pytest for running the tests.

The following code snippets are written for *ekklesia-portal* but
also work for *ekklesia-voting* when you change the project name.

## Install Nix

*Installation instructions taken from* [Getting Nix](https://nixos.org/download.html).
*See the link for other installation methods.*

Nix is currently supported on Linux and Mac. The quickest way to install
Nix is to open a terminal and run the following command (as a user other
than root with sudo permission):

```shell
curl -L https://nixos.org/nix/install | sh
```

Make sure to follow the instructions output by the script. The
installation script requires that you have sudo access to root.

## Install Lorri

A good way to get a development shell is to use
[Lorri](https://github.com/nix-community/lorri) which improves the builtin
`nix-shell` command. Another option is to use *nix-direnv* as described in the next section.

Install `lorri` (also works for updates):

```shell
nix-env -i lorri
```

This is enough to use `lorri shell` needed for the quick start section
below.

We also recommend using the `direnv` integration. This will
automatically enter the development shell when changing to the project
directory. Please follow the [Lorri Installation
Instructions](https://github.com/nix-community/lorri#setup-on-nixos-or-with-home-manager-on-linux).

## Setting up nix-direnv

Instead of lorri (described above), you can also use direnv \<<https://direnv.net>>\`\_
with [nix-direnv](https://github.com/nix-community/nix-direnv) to get a
automatically updating development shell. See the linked pages for
instruction on how to set them up.

(cachix-binary-cache)=

## Setting up the Cachix Binary Cache

To speed up installation, you should add the edemocracy binary cache hosted on [Cachix](https://cachix.org).

If your user can edit Nix config files (when using a single-user installation on a non-NixOS system, for example),
just install the Cachix client and add the edemocracy cache:

```shell
nix-env -i cachix
cachix use edemocracy
```

If cachix cannot change the config, it will instructions on how to do it.
On NixOS, you have to run cachix as root (`sudo cachix use edemocracy`) or another trusted Nix user.

## Running PostgreSQL as User

You can run a PostgreSQL database server with your user permissions if
you don’t want to use an existing database server. Run the pg_ctl
commands from the nix shell.

Run as user:

```shell
pg_ctl -D ~/postgresql init
postgres -D ~/postgresql -k /tmp -h ''
```

Create database (in another terminal):

```shell
createdb -h /tmp ekklesia_portal
```

You can connect to the database with psql now:

```shell
psql -h /tmp ekklesia_portal
```

Use the following connection string in the app config file:

```yaml
database:
  uri: "postgresql+psycopg2:///ekklesia_portal?host=/tmp"
```

## Updating The Development Environment

`lorri shell` always installs changed dependencies and tools before
entering the development shell which takes some seconds.

When using the `direnv` integration, running `lorri daemon` in the
background automatically updates the development shell when something
changes. Press Enter in the development shell to trigger the first
daemon build or to see the changes in the shell made by `direnv`.

You can also trigger an update by running `lorri watch --once` if you
don’t want to run `lorri daemon`.

## Editor / IDE Integration

*Tested with VSCode, Pycharm*

Run this to build the environment:

```shell
./python_dev_env.nix
```

This creates a directory {file}`pyenv` that is similar to a Python virtualenv.
The Environment should be picked up by the IDE using the Python interpreter
in the directory. A restart may be required.
