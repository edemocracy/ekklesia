(quickstart)=

# Development Quick Start

This chapter describes briefly how to set up a development environment to run a
local instance of the application.

Setting up the environment for testing and running tests is described in
{ref}`testing`.

The following instructions assume that *Nix* is already installed, has Nix
flakes enabled, and an empty + writable PostgreSQL database can be accessed
somehow.

If you don't have *Nix* with Flakes support and or can’t use an existing
PostgreSQL server, have a look at {ref}`dev-env`.

It's strongly recommended to also follow the instructions at 
{ref}`cachix-binary-cache` to speed up the installation.

1. Clone the repository and enter the Nix dev shell in the project root folder
   to open a shell which is your dev environment:

   ```
   git clone https://github.com/edemocracy/ekklesia-portal
   cd ekklesia-portal
   nix develop
   ```

2. Compile translations and CSS (look at `dodo.py` to see what this does):

   ```
   doit
   ```

3. Create a config file named `config.yml` using the config template
   from `src/ekklesia_portal/config.example.yml` or skip this to use
   the default settings from `src/ekklesia_portal/default_settings.py`.
   Make sure that the database connection string points to an
   empty + writable database.

4. Set up the database for testing (look at `flake.nix` to see what this does):

   ```
   create_test_db
   ```

5. Run tests:

   ```
   pytest
   ```

6. Run the development server (look at `flake.nix` to see what this does):
   ```
   run_dev
   ```

Run `help` to see all commonly used dev shell commands.
