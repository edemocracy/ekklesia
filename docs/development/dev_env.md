(dev-env)=

# Development Environment

:::{note}
To get an overview on how to set up a development environment, please read
{ref}`quickstart`
or see {ref}`dev-nixos-virtualbox` to learn how to set up a NixOS development VM
from start to finish.
:::

To get a consistent development environment, we use
[Nix](https://nixos.org/nix) to install Python and the project
dependencies. The development environment also includes PostgreSQL,
linters, a SASS compiler and pytest for running the tests.

The following code snippets are written for *ekklesia-portal* but
also work for *ekklesia-voting* when you change the project name.

## Install Nix

:::{note}
There's a new guide, 
[Zero to Nix: Get Nix running on your system](https://zero-to-nix.com/start/install)
which uses an alternative installer that wants to make it easier to set up Nix
in the correct way.  This looks promising but we haven't tested it, yet. Please
try it out!
:::

### Official Nix installer

*Installation instructions taken
from* [Getting Nix](https://nixos.org/download.html).
*See the link for other installation methods.*

Nix is currently supported on Linux and Mac. The quickest way to install
Nix is to open a terminal and run the following command (as a user other
than root with sudo permission):

```shell
curl -L https://nixos.org/nix/install | sh
```

Make sure to follow the instructions output by the script. The
installation script requires that you have sudo access to root.

### Enable Nix Flakes support

We use Nix Flakes, which are a widely used feature of Nix. They are still marked
as experimental, though, so we need to enable the feature flag first if you
used the official installation method.

You can add the required config to your local Nix config file like this:

```shell
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf 
```

See [Flakes - NixOS Wiki](https://nixos.wiki/wiki/Flakes) for more
details and other methods.

if you want to know more about Nix Flakes, see
[Zero to Nix: Nix flakes](https://zero-to-nix.com/concepts/flakes)

(direnv)=

## Direnv

Use [direnv](https://direnv.net) together with
[nix-direnv](https://github.com/nix-community/nix-direnv) to get a automatically
updating development shell. See the linked pages for instruction on how to set
them up.

There's a :file:`envrc.example` in the project repository root which shows how
to configure `direnv` for the project.

(cachix-binary-cache)=

## Setting up the Cachix Binary Cache

To speed up installation, you should add the edemocracy binary cache hosted
on [Cachix](https://cachix.org).

If your user can edit Nix config files (when using a single-user installation on
a non-NixOS system, for example),
just install the Cachix client and add the edemocracy cache:

```shell
nix-env -if https://github.com/cachix/devenv/tarball/latest
cachix use edemocracy
```

If cachix cannot change the config, it will instructions on how to do it.
On NixOS, you have to run cachix as root (`sudo cachix use edemocracy`) or
another trusted Nix user.

## Install devenv

We use [devenv](https://devenv.sh/) to provide a development shell environment.
You don't have to install this separately to work on the project and a 
limited version of devenv is available in the development shell itself but you 
might find some devenv commands useful, especially when working on project
dependencies. We will probably use this tool more in the future.

```shell
nix-env -if https://github.com/cachix/devenv/tarball/latest
```

See [Getting Started - devenv](https://devenv.sh/getting-started/) for more
details. The documentation there also repeats some of the steps also included
in here, like setting up Cachix and Nix.

## Running PostgreSQL as User

You can run a PostgreSQL database server with your user permissions if
you don’t want to use an existing database server. Run the pg_ctl
commands from the Nix dev shell.

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

When using the `direnv` integration, the shell is automatically updated when
something changes in the Python dependencies or the Nix code of the project.
Press *Enter* in the development shell to trigger the build or run `direnv
allow` if direnv didn't recognize a change.

If you don't use `direnv`, exit your current shell and run `nix develop` again.

## Editor / IDE Integration

*Tested with VSCode, Pycharm*

Run this in the dev shell to build the environment:

```shell
build_python_venv
```

This creates a directory {file}`venv` that looks like a Python virtualenv.
The Environment should be picked up by the IDE using the Python interpreter
in the directory. A restart of the IDE may be required.
