.. _running:

*********************
Running In Production
*********************

A production environment can be built by Nix. The generated output
doesn’t have additional requirements. The application can be run by a
start script directly or using the Docker image built by Nix. Static
assets are built separately and can be served by the included minimal
Nginx. As for the application itself, we can build a standalone start
script or a Docker image.


Without Docker
==============

* Build and run app with the config file ``config.yml``:

.. code-block:: shell

    nix-build nix/serve_app.nix -o serve_app && serve_app/bin/run config.yml


* Build static assets and run Nginx:

.. code-block:: shell

    nix-build nix/serve_static.nix -o serve_static && serve_static/bin/run


* Build static assets for use with another web server:

.. code-block:: shell

    nix-build nix/static_files.nix -o static_files


With Docker
===========

By default, Docker images are tagged with a version string derived from
the last Git tag. You can set a different tag by adding
``--argstr tag mytag`` to the ``docker*.nix`` calls.

* Build and import app image:

.. code-block:: shell

    ./docker.nix –argstr tag mytag docker load -i docker-image-ekklesia-portal.tar


* Build and import static file image:

.. code-block:: shell

    ./docker_static.nix –argstr tag mytag docker load -i docker-image-ekklesia-portal-static.tar


* Run app container:

.. code-block:: shell

    docker run -p 127.0.0.1:8080:8080 -it -v $(pwd)/config-docker.yml:/config.yml ekklesia-portal:mytag


* Run static file container:

.. code-block:: shell

    docker run -p 127.0.0.1:8081:8080 -it ekklesia-portal-static:mytag


The app is now served at port 8080 and static files at port 8081 which
are only reachable from localhost (127.0.0.1).
