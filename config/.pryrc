## Settings
Pry.config.color = true
Pry.config.editor = "vim"

## Below others cooperation
# refs: https://github.com/pry/pry/wiki/FAQ#wiki-awesome_print
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
  puts err
end

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-hirb
if defined? Hirb
 Hirb::View.instance_eval do
   def enable_output_method
     @output_method = true
     @old_print = Pry.config.print
     Pry.config.print = proc do |output, value|
       Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
     end
   end

   def disable_output_method
     Pry.config.print = @old_print
     @output_method = nil
   end
 end

 Hirb.enable
end

# refs: https://github.com/nixme/pry-debugger#tips
