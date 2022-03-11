(stylesheets)=

# Stylesheets

## Generate CSS

CSS is compiled from Sass files that include files from Bootstrap and
Font-Awesome. sassc is used as Sass compiler.

Generate CSS with:

```shell
sassc -I $SASS_PATH src/ekklesia_portal/sass/portal.sass \
  src/ekklesia_portal/static/css/portal.css
```
