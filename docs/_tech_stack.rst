* Backend:

    * Main language: `Python 3.9 <https://www.python.org>`_
    * Web framework: `Morepath <http://morepath.readthedocs.org>`_
    * Testing: `pytest <https://pytest.org>`_,
      `WebTest <https://docs.pylonsproject.org/projects/webtest/en/latest/>`_

* Frontend

    * Templates `Pyjade <https://github.com/syrusakbary/pyjade>`_ (syntax like `Pug <https://pugjs.org>`_)
      with `Jinja <https://jinja.palletsprojects.com>`_ as template engine.
    * `Sass <https://sass-lang.com>`_ Framework `Bootstrap 4 <https://getbootstrap.com>`_
    * `htmx <https://htmx.org>`_ for "AJAX" requests directly from HTML.

* Database: `PostgreSQL 13 <https://www.postgresql.com>`_
* Dependency management and build tool: `Nix <https://nixos.org/nix>`_
* (Optional) Docker / Kubernetes for running Docker images built by Nix
