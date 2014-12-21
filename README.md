#Bootstrap Grid System
---
The Bootstrap Grid System gem is a small and very simple tag generator for Bootstrap gem.
##Dependencies
---
Rails 4
Bootstrap-sass
##Installation
---
Add the gem to your Gemfile
`gem 'bootstrap-grid-system'`
Bundle install
`bundle install`
##Examples
---
###Bootstrap row
Use `bootstrap_row` to wrap the content in a div block with class "row"
```
<%= bootstrap_row { "Example" } %>
```
This generates the following HTML:
```
<div class="row">Example</div>
```
Use `class:` option to add your class
```
<%= bootstrap_row(class: "foo") { "Example" } %>
```
This generates the following HTML:
```
<div class="row foo">Example</div>
```
###Bootstrap col
Use `bootstrap_col` to wrap the content in a div block with class "col-md-12"
```
<%= bootstrap_col { "Example" } %>
```
This generates the following HTML:
```
<div class="col-md-12">Example</div>
```
##License
---
This project rocks and uses MIT-LICENSE.