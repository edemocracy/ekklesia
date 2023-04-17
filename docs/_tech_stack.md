- Backend:
  - Main language: [Python 3.11](https://www.python.org)
  - Web framework: [Morepath](http://morepath.readthedocs.org)
  - Web API framework for ekklesia-notify: [FastAPI](https://fastapi.tiangolo.com/)
  - Testing: [pytest](https://pytest.org),
    [WebTest](https://docs.pylonsproject.org/projects/webtest/en/latest/)
- Frontend
  - Templates [PyPugJS](https://github.com/kakulukia/pypugjs) (similar to [Pug](https://pugjs.org))
    with [Jinja](https://jinja.palletsprojects.com) as template engine.
  - [Sass](https://sass-lang.com) Framework [Bootstrap 4](https://getbootstrap.com)
  - [htmx](https://htmx.org) for "AJAX" requests directly from HTML.
- Database: [PostgreSQL 15](https://www.postgresql.com)
- Dependency management and build tool: [Nix](https://nixos.org/nix)
- Documentation: [Sphinx](https://sphinx-doc.org) with [MyST Markdown](https://myst-parser.readthedocs.io) parser.
- (Optional) Docker / Kubernetes for running Docker images built by Nix
