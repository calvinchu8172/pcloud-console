Rails.application.configure do
  app_info = config_for(:app_info).deep_symbolize_keys
  app_info[:full_version] = File.read(Rails.root.join('VERSION')).strip
  app_info[:version] = app_info[:full_version].split('-').first
  config.app_info = app_info
end

class App
  def self.method_missing(method, *args, &block)
    Rails.configuration.app_info[method] || 'Unknown'
  end
end
