#Bootstrap Grid System
The Bootstrap Grid System gem is a small and very simple tag generator for Bootstrap gem.
##Dependencies
Ruby 1.9+  
Rails 4.0+  
Twitter Bootstrap 3.0+
##Installation
Add the gem to your Gemfile
`gem 'bootstrap-grid-system'`
Bundle install
`bundle install`
##Examples
###Bootstrap row
Use `bootstrap_row` to wrap the content in a div block with "row" class
```
<%= bootstrap_row { "Example" } %>
```
This generates the following HTML:
```
<div class="row">Example</div>
```
###Bootstrap col
Use `bootstrap_col` to wrap the content in a div block with "col-md-12" class
```
<%= bootstrap_col { "Example" } %>
```
This generates the following HTML:
```
<div class="col-md-12">Example</div>
```
To change the default number of columns, use the `:col` or `:offset_col` options
```
<%= bootstrap_col(col: 2, offset_col: 4) { "Example" } %>
```
This generates the following HTML:
```
<div class="col-md-2 col-md-offset-4">Example</div>
```
To change the default grid class, use the `:grid_system` option
```
<%= bootstrap_col(grid_system: :lg) { "Example" } %>
```
This generates the following HTML:
```
<div class="col-lg-12">Example</div>
```
###Bootstrap row with col
Use `bootstrap_row_with_col` to wrap the content in a div block with "row" class and div with class "col-md-12" inside
```
<%= bootstrap_row_with_col { "Example" } %>
```
```
<div class="row">
	<div class="col-md-12">Example</div>
</div>
```
To change the default number of columns, use the `:col` or `:offset_col` options
```
<%= bootstrap_row_with_col(col: 2, offset_col: 4) { "Example" } %>
```
This generates the following HTML:
```
<div class="row">
	<div class="col-md-2 col-md-offset-4">Example</div>
</div>
```
To change the default grid class, use the `:grid_system` option
```
<%= bootstrap_row_with_col(grid_system: :lg) { "Example" } %>
```
This generates the following HTML:
```
<div class="row">
	<div class="col-lg-12">Example</div>
</div>
```
###Standard html options
Use `:id` or `:class` options to add your value
```
<%= bootstrap_row_with_col(id: "foo", class: "bar") { "Example" } %>
```
This generates the following HTML:
```
<div class="row bar" id="foo">
	<div class="col-md-12">Example</div>
</div>
```
##License
This project rocks and uses MIT-LICENSE.