.. _testing:

*******
Testing
*******

Tests are written and executed using `pytest <https://pytest.org>`_.


Setup
=====

If you don't have *Nix* and *lorri* or can’t use an existing PostgreSQL server,
have a look at :ref:`dev-env`.

Steps 1 and 2 can be skipped when you already followed :ref:`quickstart`.
Steps 3 and 4 set up a separate database for running the tests.

1. Clone the repository and enter nix shell in the project root folder to open a shell which is
   your test environment::

    git clone https://github.com/edemocracy/ekklesia-portal
    cd ekklesia-portal
    lorri shell


2. Compile translations and CSS (look at dodo.py to see what this does)::

    doit

3. Make sure that the database connection URL points to an empty + writable database.
   By default, the tests use the Postgres socket in :file:`/tmp` and the database name is
   ``test_ekklesia_portal``. You can set the environment variable
   ``EKKLESIA_PORTAL_TEST_DB_URL`` to customize the database connection.


4. Initialize the test database::

   python tests/create_test_db.py


Running Tests
=============

The tests can be run inside a Nix/lorri shell with the :command:`pytest`
command from the repository root directory.

You can supply a path to run only a part of the test suite, here only for the proposition concept::

    pytest tests/concepts/proposition

This also works for single modules::

   pytest tests/concepts/proposition/test_propositions.py

Or you can select tests by a part of the name::

   pytest -k test_arg

See the `Usage and Invocations <https://docs.pytest.org/en/stable/usage.html>`_
in the pytest documentation for more info.
