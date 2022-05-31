(concept-tutorial)=

# Concept Tutorial

A concept is a way to organize code.
Technically it's a package that bundles the code needed to view, create, modify and delete
(or CRUD: create, read, update, delete) a *thing* or *entity* in your application's domain.
Most applications will consist of multiple concepts.
Typical concepts would be user, profile, comment, item, document or department.

The *thing* we want to implement here is a blog post.
We use *ekklesia-portal* as target project here but this also works for other Python
Ekklesia applications with a Web UI.

## Building Blocks

Concepts use the following objects passed in from the outside:

- **Request**: A HTTP request object, provided by [WebOb](https://docs.pylonsproject.org/projects/webob/en/stable)
  and extended by [Morepath's Request](https://morepath.readthedocs.io/en/latest/api.html#morepath.Request).
  Gives access to a database session, POST data, a browser session and application settings, for example.
- **Model**: Typically, this is an object from a database or a collection of them.
  But can be of any class that is used to carry around information belonging to a concept.

```{eval-rst}
.. graphviz::
   :caption: Building blocks of a concept

   digraph concept {
      Path -> Model
      View -> Model
      View -> Cell
      Cell -> Model
      Cell -> Template[dir=both]
      Cell -> Form
      Form -> Schema
      Form -> Model[dir=both]
      Cell -> Request
      Path -> Request
      View -> Request
      Form -> Request
   }
```

- **Cell**: Renders a HTML view of a concept by using data from a model object.
- **Template**: Cells usually produce HTML output by using a {ref}`PyPugJS Template <templates>`.
  Templates use code from their associated cell and model fields to display stuff.
- **Path**: Maps URL pattern to a model. It's easy to link to model instances from cells by using the `request.link` method.
  (-> [Morepath: Paths and Linking](https://morepath.readthedocs.io/en/latest/paths_and_linking.html))
- **View**: Contains code to prepare and render a HTTP response.
  In most cases, HTML views should delegate the actual rendering to a cell.
  (-> [Morepath: Views](https://morepath.readthedocs.io/en/latest/views.html))
- **Form**: Renders a HTML form based on a schema, captures the HTTP response and passes the input to the schema for validation.
  (-> [Deform: Basic Usage](https://docs.pylonsproject.org/projects/deform/en/latest/basics.html))
- **Schema**: Defines properties that are rendered by a form, validates incoming data that should be written to a model object.

## Generate a Concept

The Command {command}`ekklesia-generate-concept` generates a working concept implementation together with a test.
It contains views for creating, editing and displaying instances of the concept.

Let's generate our Comment concept:

```console
$ ekklesia-generate-concept blog_post

generated concept /home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/blog_post,
tests are located at tests/concepts/blog_post
```

The generate source tree looks like this:

```
$ tree /home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/blog_post
/home/ts/git/ekklesia-portal/src/ekklesia_portal/concepts/blog_post
├── blog_post_cells.py
├── blog_post_contracts.py
├── blog_post_helper.py
├── blog_posts.py
├── blog_post_views.py
├── __init__.py
└── templates
    ├── blog_post.j2.jade
    ├── blog_posts.j2.jade
    ├── edit_blog_post.j2.jade
    └── new_blog_post.j2.jade
```

- {file}`blog_post_views.py`: path and view functions
  - path blog_posts: handles listing blog posts and creating new ones
  - path blog_post: handles viewing a blog post and editing it
  - view index: list blog posts
  - view new: show form for new blog post
  - view create: handle POST request from the new blog post form
  - view edit: show form for editing an existing blog post
  - view update: handle POST request from the edit blog post form

- {file}`blog_post_contracts.py`: bundles blog post schema and form

- {file}`blog_posts.py`: collection model used by the blog posts path

- {file}`blog_post_helper.py`: utilities that can be used in cells and from other concepts

```{eval-rst}
.. graphviz::
   :caption: Generated files for the Comment concept

   digraph concept {
      "blog_post_views.py" -> "blog_post_cells.py"
      "blog_post_views.py" -> "blog_post_contracts.py"
      "blog_post_cells.py" -> "templates/*.j2.jade"
      "blog_post_cells.py" -> "blog_posts.py"
   }

```

Tests live outside of the application package:

```
$ tree /home/ts/git/ekklesia-portal/tests/concepts/blog_post
/home/ts/git/ekklesia-portal/tests/concepts/blog_post
├── __init__.py
└── test_blog_posts.py
```

## Test it

- unit test a cell: given a model instance, when using an option or not, then produces the expected HTML output
- functional testing of views: fill out forms, submit and check output with WebTest

## Extend it

- implement cell properties that can be used in a template
- extend the schema and set custom widgets in blog_post_contracts
- put more path and view functions in blog_post_views
- (a bit more advanced) refactor templates with fragments
