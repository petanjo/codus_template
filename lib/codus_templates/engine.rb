module CodusTemplates
  class Engine < ::Rails::Engine

    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    config.assets.paths << "#{Rails.root}/vendor/assets/images"

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
