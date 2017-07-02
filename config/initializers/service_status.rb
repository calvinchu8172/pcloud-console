module ServiceStatus
  class Middleware

    def initialize(app, options={})
      @app = app
    end

    def call(env)
      if env['REQUEST_METHOD'] == 'GET' && service_status_path?(env['PATH_INFO'])
        service_status_response
      else
        @app.call(env)
      end
    end

    protected

    def service_status_path?(request_path)
      request_path == '/service/status'
    end

    def service_status_response
      builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.service(name: 'status') {
          xml.env(App.stack_env)
          xml.hostname(App.hostname)
          xml.version(App.full_version)
        }
      end
      # [status, headers, body]
      [200, { 'Content-Type' => 'application/xml' }, [builder.to_xml]]
    end
  end
end

Rails.application.configure do
  config.middleware.insert_after Rails::Rack::Logger, ServiceStatus::Middleware
end
