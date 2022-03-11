(dependencies)=

# Dependency Management

:::{note}
You only have to work with Poetry commands if you want to change Python dependencies.
The Nix development shell provides a working Python interpreter with all needed packages.
:::

Python dependencies are managed by [Poetry](https://python-poetry.org).
We use [poetry2nix](https://github.com/dpausp/poetry2nix) to integrate Poetry with our Nix automation code.
Changes in the Poetry dependencies specification are picked up by Nix on the next run.
If you use the [Lorri](https://github.com/target/lorri) daemon, adding, updating or removing packages
automatically rebuilds the development shell which provides a Python interpreter with the wanted Python packages.

Python package names and version constraints are listed in the `[tool.poetry.dependencies]`
and `[tool.poetry.dev-dependencies]` sections of {file}`pyproject.toml`.

Common Python packages for all applications are provided by *ekklesia-common*.
To see what's available, use `poetry show ekklesia-common` or have a look at {file}`pyproject.toml`.

`poetry show` lists all packages that are pulled in directly or are dependencies of dependencies:

```
alembic               1.4.2           A database migration tool for SQLAlchemy.
dectate               0.14            A configuration engine for Python frameworks
deform                2.0.10          Form library with advanced features like nested forms
ekklesia-common       20.07.0 b7c71cf
```

*ekklesia-common* is a Git dependency, so Poetry shows the version and the short Git commit id.

`poetry update` updates dependencies to their latest versions allowed by the version constraints.

`poetry add <package>` and `poetry remove <package>` should work as expected.

After changing dependencies, it's a good idea to run `nix-build` to see if everything builds with Nix.
Using `lorri daemon` also helps finding problems. Some "exotic" packages need further help to build with Nix.
Problems can be caused by build dependencies that aren't recognized automatically by poetry2nix.
In this case, the overrides in {file}`deps.nix` must be changed.
We already have some examples of doing that.
Poetry2nix provides a lot of common overrides so most popular packages should just work.
