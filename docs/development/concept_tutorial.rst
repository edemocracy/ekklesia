Concept Tutorial
================

Basic Ideas
-----------

* **Request**: A HTTP request object, provided by `WebOb <https://docs.pylonsproject.org/projects/webob/en/stable>`_
  and extended by `Morepath's Request <https://morepath.readthedocs.io/en/latest/api.html#morepath.Request>`_.
* **Model**: Typically, this is an object from a database or a collection of them.
  But can be of any class that is used to carry around information about a concept.
* **Cell**: Renders a HTML view of a concept by using data from a model object.
* **Template**: Cells usually produce HTML output by using a PyJade template.
  Templates use code from their associated cell and model fields to display stuff.
* **Path**: Maps URL pattern to a model. It's easy to link to model instances from cells by using the ``request.link`` method.
  (-> `Morepath: Paths and Linking <https://morepath.readthedocs.io/en/latest/paths_and_linking.html>`_)
* **View**: Contains code to prepare and render a HTTP response.
  In most cases, HTML views should delegate the actual rendering to a cell.
  (-> `Morepath: Views <https://morepath.readthedocs.io/en/latest/views.html>`_)
* **Contract**: Has a *schema* that validates incoming data that should be written to a model object.
  It's used by a *form* that renders a HTML form, captures the HTTP response and passes the input to the schema for validation.
  (-> `Deform: Basic Usage <https://docs.pylonsproject.org/projects/deform/en/latest/basics.html>`_)

.. graphviz::
   :caption: Parts of a Concept

   digraph concept {
      Path -> View
      Path -> Model
      View -> Model
      View -> Cell
      Cell -> Model
      Cell -> Template
      Cell -> Form
      Form -> Schema
   }

Generate a Concept
------------------

The Command :command:`ekklesia-generate-concept` generates a working concept implementation together with a test.
It contains views for creating, editing and displaying instances of the concept.

Let's generate our Comment concept:

.. code-block:: console

    $ ekklesia-generate-concept comment

    generated concept /home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/comment,
    tests are located at tests/concepts/comment


The generate source tree looks like this::

    $ tree /home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/comment
    /home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/comment
    ├── comment_cells.py
    ├── comment_contracts.py
    ├── comment_helper.py
    ├── comments.py
    ├── comment_views.py
    ├── __init__.py
    └── templates
        ├── comment.j2.jade
        ├── comments.j2.jade
        ├── edit_comment.j2.jade
        └── new_comment.j2.jade


Tests live outside of the application package::

    $ tree /home/ts/git/ekklesia-portal/tests/concepts/comment
    /home/ts/git/ekklesia-portal/tests/concepts/comment
    ├── __init__.py
    └── test_comments.py



.. graphviz::
   :caption: Comment Concept

   digraph concept {
      "comment_views.py" -> "comment_cells.py"
      "comment_views.py" -> "comment_contracts.py"
      "comment_cells.py" -> "templates/*.j2.jade"
      "comment_cells.py" -> "comments.py"
   }


Extending
---------

Testing
-------
