.. _templates:

Templates
=========

We use `PyJade <https://github.com/syrusakbary/pyjade>`_ as a Jinja extension.
Templates with the extension `.j2.jade` are passed to PyJade and converted to a Jinja template.

Our templates mostly support the syntax of `Pug <https://pugjs.org/api/getting-started.html>`_ which was called *Jade* before.
Instead of Javascript, pieces of code in templates are interpreted as Jinja code.
Keep that in mind when reading the language reference for Pug.
As a basic rule, keep complicated logic away from templates and use Python code from the cell associated with a template.
Reading existing templates helps.

Simple HTML Tags
----------------

Tag attributes look similar to HTML, with commas between them.
Simple values are strings with quotes:

.. code-block:: pug

    a(href='//example.com', target='_blank') Example


.. code-block:: pug

    a(href=example_url, target=("_blank" if open_in_new_tab else "") Example


Conditionals
------------

.. code-block:: pug

    if details
        = details


Comments
--------

.. code-block:: pug

    // comment which is rendered into HTML



