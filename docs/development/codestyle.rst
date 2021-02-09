.. _codestyle:

**********
Code Style
**********

We use `YAPF <https://github.com/google/yapf>`_ to check Python code style and
apply automatic formatting.

Code should conform to `PEP8 <https://www.python.org/dev/peps/pep-0008>`_, the style guide for Python code.
YAPF goes beyond that and applies stylistic changes as configured in the style file :file:`.style.yapf`.
Our maximal line length is 120.

Auto-Formatting Python Code
===========================

Running :command:`yapf -dr src` shows a diff for the entire source directory.
:command:`yapf -ir src` formats everything in-place (git commit first!).

An alias to auto-format only changed files as seen by Git may be helpful:

.. code:: shell

    alias py-format-changed="git ls-files -m --others --exclude-standard | grep '\.py$' | xargs yapf -i"

Style Tips
==========

If you want each list value to stay on a separate line, use a trailing comma after
the last element (here after ``'created_at'``):

.. code:: python

    model_properties = [
        'abstract',
        'author',
        'ballot',
        'content',
        'created_at',
    ]

More About Code Style
=====================

- Recommended talk: `Raymond Hettinger - Beyond PEP 8 -- Best practices for beautiful intelligible code - PyCon 2015 <https://www.youtube.com/watch?v=wf-BqAjZb8M>`_
