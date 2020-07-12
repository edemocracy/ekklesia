*******
Testing
*******

Tests are written and executed using Pytest.

Running Tests
=============

1. Enter nix shell in the project root folder to open a shell which is
   your test environment:

.. code-block:: shell

   cd ekklesia-portal
   nix-shell


2. Compile translations:


.. code-block:: shell

   ipython makebabel.ipy compile


3. Create a config file named ``testconfig.yml`` using the config
   template from ``tests/testconfig.example.yml`` Make sure that the
   database connection string points to an empty + writable database.

4. Initialize the test database:

.. code-block:: shell

   python tests/create_test_db.py -c testconfig.yml


5. The tests can be run with ``pytest`` from the repository root
   directory.
