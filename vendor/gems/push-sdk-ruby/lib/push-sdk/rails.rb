module Push
  class Engine < ::Rails::Engine

    config.before_configuration do |app|
      app.configure do
        config_for(:push).each { |k, v| ENV[k] = v }
      end
    end
  end
end
