module MyTimeline
  module Github
    class Engine < ::Rails::Engine
      isolate_namespace MyTimeline::Github

      config.autoload_paths << File.expand_path("../../../app/classes/**", __FILE__)
      config.autoload_paths << File.expand_path("../../../app/scrapers/**", __FILE__)

      config.generators do |g|
        g.test_framework      :rspec,        fixture: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.assets false
        g.helper false
      end

      config.after_initialize do |app|
        MyTimeline.register_plugin :github, defaults: {user_token: nil}
      end

      rake_tasks do
        load File::expand_path "railties/github_tasks.rake", File.dirname(__FILE__)
      end
    end
  end
end
