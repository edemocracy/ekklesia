.. _quickstart:

***********************
Development Quick Start
***********************

Set up an environment to run an local instance of the application.

Setting up the environment for testing and running tests is described in :ref:`testing`.


The following instructions assume that *Nix* and *lorri* are already installed,
and an empty + writable PostgreSQL database can be accessed somehow.

If you don't have *Nix* and *lorri* or can’t use an existing PostgreSQL server,
have a look at :ref:`dev-env`.

1. Clone the repository and enter nix shell in the project root folder to open a shell which is
   your dev environment::

    git clone https://github.com/edemocracy/ekklesia-portal
    cd ekklesia-portal
    lorri shell


2. Compile translations and CSS::

    makebabel.ipy compile
    sassc -I $SASS_PATH src/ekklesia_portal/sass/portal.sass \
        src/ekklesia_portal/static/css/portal.css


3. Create a config file named ``config.yml`` using the config template
   from ``src/ekklesia_portal/config.example.yml`` or skip this to use
   the default settings from ``src/ekklesia_portal/default_settings.py``.
   Make sure that the database connection string points to an
   empty + writable database.

4. Initialize the dev database with a custom config file::

    python tests/create_test_db.py -c config.yml


5. The development server can be run with a custom config file by
   executing::

    python src/ekklesia_portal/runserver.py –debug -c config.yml
