# Provides a number of methods for creating a simple Bootstrap blocks
module BootstrapGridSystem
  # Creates a HTML div block with bootstrap row class.
  #
  # === Options
  # You can use only symbols for the attribute names.
  #
  # <tt>:row_disabled</tt> if set to true, the content will build without bootstrap row div block, it will return
  # empty content.
  #
  # === Examples
  # bootstrap_row { "Test" }
  # # => <div class="row">Test</div>
  #
  # bootstrap_row(class: "foo") { "Test" }
  # # => <div class="row foo">Test</div>
  #
  # bootstrap_row(row_disabled: true) { "Test" }
  # # => Test
  #
  def bootstrap_row(options = {})
    if options.delete :row_disabled
      yield
    else
      options[:class] = ["row", options[:class]].compact.join(" ")
      content_tag(:div, options) { yield }
    end
  end
  
  # Creates a HTML div block with bootstrap grid column class.
  #
  # === Options
  # You can use only symbols for the attribute names.
  #
  # <tt>:grid_system</tt> if the set value from bootstrap grid system you can chenge default value "sm" to "xs",
  # "sm", "md" or "lg". You can use string and symbols for the values
  # 
  # <tt>:offset_col</tt> if the set value in the range from 1 to 12 it generate bootstrap offset class in HTML div
  # block with bootstrap grid column.
  #
  # === Examples
  # bootstrap_col(col: 6) { "Test" }
  # # => <div class="col-sm-6">Test</div>
  #
  # bootstrap_col(col: 6, offset_col: 4) { "Test" }
  # # => <div class="col-sm-6 col-sm-offset-4">Test</div>
  #
  # bootstrap_col(col: 6, class: "foo") { "Test" }
  # # => <div class="col-sm-6 foo">Test</div>
  #
  # bootstrap_col(col: 6, grid_system: :lg) { "Test" }
  # # => <div class="col-lg-6">Test</div>
  #
  # bootstrap_col(col_disabled: true) { "Test" }
  # # => Test
  #
  def bootstrap_col(options = {})
    grid_system = options.delete :grid_system
    col         = grid_system_class options.delete(:col) || 12, grid_system
    offset_col  = grid_system_offset_class options.delete(:offset_col), grid_system
    return yield if options.delete :col_disabled
    if col || offset_col
      options[:class] = [col, offset_col, options[:class]].compact.join(" ")
      content_tag(:div, options) { yield }
    else
      yield
    end
  end
  
  # Creates a HTML div block with bootstrap row class and HTML div block with bootstrap grid column class inside.
  #
  # === Options
  # You can use only symbols for the attribute names.
  #
  # <tt>:row_disabled</tt> if set to true, it will create only HTML div block with bootstrap grid column class
  # and without HTML div block with bootstrap row class.
  #
  # === Examples
  # bootstrap_row_with_col(col: 6) { "Test" }
  # # => <div class="row">
  #        <div class="col-sm-6">
  #          Test
  #        </div>
  #      </div>
  #
  # bootstrap_row_with_col(col: 6, offset_col: 4) { "Test" }
  # # => <div class="row">
  #        <div class="col-sm-6 col-sm-offset-4">
  #          Test
  #        </div>
  #      </div>
  #
  # bootstrap_row_with_col(col: 6, class: "foo") { "Test" }
  # # => <div class="row foo">
  #        <div class="col-sm-6">
  #          Test
  #        </div>
  #      </div>
  #
  # bootstrap_row_with_col(col: 6, grid_system: :lg) { "Test" }
  # # => <div class="row">
  #        <div class="col-lg-6">
  #          Test
  #        </div>
  #      </div>
  #
  # bootstrap_row_with_col(row_disabled: true) { "Test" }
  # # => <div class="col-lg-6">
  #        Test
  #      </div>
  #
  # bootstrap_row_with_col(col_disabled: true) { "Test" }
  # # => <div class="row">
  #        Test
  #      </div>
  #
  def bootstrap_row_with_col(options = {})
    col_tag = bootstrap_col(options.slice(:col, :offset_col, :grid_system, :col_disabled)) { yield }
    bootstrap_row(options.except(:col, :offset_col, :grid_system, :col_disabled)) { col_tag }
  end
  
  # Creates a HTML class with Bootstrap col.
  #
  def grid_system_class(col = nil, grid_system = nil)
    "col-#{(grid_system || default_grid_system).to_s}-#{col}" if col
  end
  
  # Creates a HTML class with Bootstrap offset-col.
  #
  def grid_system_offset_class(col = nil, grid_system = nil)
    "col-#{(grid_system || default_grid_system).to_s}-offset-#{col}" if col
  end
  
  private
  
  def default_grid_system
    "md"
  end
end

ActionView::Base.send :include, BootstrapGridSystem
