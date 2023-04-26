(stylesheets)=

# Stylesheets

CSS is compiled from [Sass](https://sass-lang.com/) files in
{file}`src/ekklesia_portal/sass` which include files from
[Bootstrap](https://getbootstrap.com/) and [Font Awesome](https://fontawesome.com/).

[`sassc`](https://sass-lang.com/libsass) is used as Sass compiler.

## Generate CSS

Compile CSS (look at {file}`dodo.py` to see what this does):

```shell
doit css_compile
```
