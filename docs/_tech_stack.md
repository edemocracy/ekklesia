- Backend:
  - Main language: [Python 3.10](https://www.python.org)
  - Web framework: [Morepath](http://morepath.readthedocs.org)
  - Testing: [pytest](https://pytest.org),
    [WebTest](https://docs.pylonsproject.org/projects/webtest/en/latest/)
- Frontend
  - Templates [Pyjade](https://github.com/syrusakbary/pyjade) (syntax like [Pug](https://pugjs.org))
    with [Jinja](https://jinja.palletsprojects.com) as template engine.
  - [Sass](https://sass-lang.com) Framework [Bootstrap 4](https://getbootstrap.com)
  - [htmx](https://htmx.org) for "AJAX" requests directly from HTML.
- Database: [PostgreSQL 13](https://www.postgresql.com)
- Dependency management and build tool: [Nix](https://nixos.org/nix)
- (Optional) Docker / Kubernetes for running Docker images built by Nix
