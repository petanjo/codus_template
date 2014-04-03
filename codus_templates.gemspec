$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "codus_templates/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "codus_templates"
  s.version     = CodusTemplates::VERSION
  s.authors     = ["Vinícius Alves Oyama"]
  s.email       = ["vinicius.oyama@codus.com.br"]
  s.homepage    = "https://bitbucket.org/codustecnologia/codus_templates"
  s.summary     = "Collections of helpers and templates for admin areas"
  s.description = "Collections of helpers and templates for admin areas"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.0.rc1"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency "sqlite3"
end
