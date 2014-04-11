class ShowForConfigGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))

  def copy_initializer
    copy_file './templates/show_for_config.rb', 'config/initializers/show_for_config.rb'
  end
end
