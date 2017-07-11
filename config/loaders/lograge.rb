Rails.application.configure do
  config.lograge.enabled = true
end

# override lograge data with more info
module Lograge
  class RequestLogSubscriber < ActiveSupport::LogSubscriber
    def initial_data(payload)
      data = {}
      data[:request_id] = payload[:request_id]
      data[:remote_ip]  = payload[:remote_ip]
      data[:method]     = payload[:method]
      data[:path]       = extract_path(payload)
      data[:headers]    = payload[:headers] if payload[:headers].present?
      data[:session]    = payload[:session] if payload[:session].present?
      data[:params]     = payload[:params]
      data
    end
  end
end
