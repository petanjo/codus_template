class SimpleFormConfigGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))

  def copy_initializer
    copy_file './templates/simple_form_bootstrap3.rb', 'config/initializers/simple_form_bootstrap3.rb'
  end
end
