(templates)=

# Templates

We use [PyPugJS](https://github.com/kakulukia/pypugjs) (formerly *Pyjade*) as a Jinja extension.
Templates with the extension `.j2.jade` or `.j2.pug` are passed to PyPugJS and converted to a Jinja template.

Our templates mostly support the syntax of [Pug](https://pugjs.org/api/getting-started.html) which was called *Jade* before.
Instead of Javascript, pieces of code in templates are interpreted as Jinja code.
Keep that in mind when reading the language reference for Pug.
As a basic rule, keep complicated logic away from templates and use Python code from the cell associated with a template.
Reading existing templates and following their style is a good idea.

## HTML Tags and Attributes

By default, text at the start of a line (or after only white space) represents an HTML tag.
Indented tags are nested, creating the tree structure of HTML.

```pug
ul
  li Item A
  li Item B
  li Item C
```

Tag attributes look similar to HTML, with optional commas between them.
Simple values are strings with quotes:

```pug
a(href='//example.com', target='_blank') Example
```

### Class and ID Literal

In addition to using the class attribute like in HTML, classes can be added to tags with the `.classname` syntax:

```pug
a.button.button-primary
```

```html
<a class="button button-primary"></a>
```

For divs, you can skip writing `div` and just use a class literal:

```pug
.content
```

```html
<div class="content"></div>
```

ID literals follow the same rules start with a `#`.

### Values from Expressions

Attribute values support Jinja expressions:

```pug
a.link(href=example_url, class=("extra" if options.extra else "")) Example
```

Adds "extra" to class attribute only if options.extra is true:

```html
<a class="link extra">Example</a>
```

### Boolean Attributes

```pug
input(type='checkbox' checked) [x]
|
input(type='checkbox' checked=true) [x]
|
input(type='checkbox' checked=false) []
```

### Differences to Pug

- Jinja expressions instead of Javascript
- no multiline attributes
- no special handling of class and style attributes
- no support for `&attributes` syntax

## Code

### Buffered (With Output)

`=` is used to produce output from a Jinja expression. Pug calls this *buffered code*.
This works like `{{ }}` in Jinja. For security, output is automatically escaped by Jinja.

```pug
p
  = 'This code is <escaped>!'
```

For translations, `gettext` with `_` as alias and `ngettext` from Babel are available in all templates.

Templates that are used by a Cell have access to all methods of the Cell that don't start with `_`.
Methods that only have the self argument are automatically turned into cached properties and can
be used without `()`.

```pug
a(href=index_url)= _('back_to_index')
```

This uses the return value of a cell method `def index_url(self): ...` as link target and the
translation for 'back_to_index' as link text.

:::{warning}
Don't put a space before the `=`!
:::

Often it's nicer to put the code in the next line which has the same effect as the last example:

```pug
a(href=index_url)
  = _('back_to_index')
```

#### Unescaped HTML

To output HTML without escaping, wrap the string in Python code with `Markup()` from `markupsafe`.

### Unbuffered

`-` can be used to run Jinja code directly, without output. Pug calls this *unbuffered code*.
This works like `{% %}` in Jinja.

We use it for layout extension and blocks on the Jinja level but this may go away in the future.

```pug
- extends "ekklesia/layout.j2.jade"
```

```pug
- block content
  .content
```

In Jinja syntax, that block looks like this:

```Jinja
{% block content %}
<div class="content"></div>
{% end block %}
```

Try to avoid putting code in templates, most of the time there are better ways to express things.
Logic should be implemented in a Cell method or code called by a cell method.

## Conditionals

Conditionals can check values for "truthiness" like in Jinja/Python:

```pug
if output
  = output
```

Writes `output` only if output is *truthy* (not empty string or not None, for example).

If ... else is also supported:

```pug
if options.show_full_output
  = full_output
else
  = short_output
```

## Plain Text

Text after a tag is just rendered as plain text:

```pug
p Some Text
```

You won't need that often because we want to translate most of the strings.

Use a pipe to put plain text on a separate line. Whitespace after the pipe is included in the output.

```pug
p
  |Some Text
  | More Text
```

Whitespace at the end of the line is also rendered!
This should be avoided because many editors will strip trailing whitespace and change semantics of the template.

```html
<p>Some Text More Text</p>
```

### Mixing Code with Text

Let's say we want to output two values separated by a space:

```pug
p
  = first_part
  |&nbsp;
  = second_part
```

## Iteration

Use for to iterate over a sequence:

```pug
ul
  for item in items
    = li.list-item= item.text
```

## Comments

```pug
// comment which is rendered to a HTML comment

//- comment which is just for the template, not rendered to HTML
```

## Code Style

- Always use 2 spaces for indentation. Do not mix!
- Line length should not exceed 120, but sometimes it's necessary to write longer lines.
- Avoid putting `= output` directly after a HTML tag, especially when it has multiple attributes.
  Put it on a indented line instead.
