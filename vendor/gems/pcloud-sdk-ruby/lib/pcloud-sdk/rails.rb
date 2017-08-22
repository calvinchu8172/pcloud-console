module Pcloud
  class Engine < ::Rails::Engine

    config.before_configuration do |app|
      app.configure do
        config_for(:pcloud).each { |k, v| ENV[k] = v }
      end
    end
  end
end
