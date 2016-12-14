# set logger level
if Rails.env.production?
  ActiveRecord::Base.logger.level = Logger::INFO
  ActionMailer::Base.logger.level = Logger::INFO
end

# set cache log silence
Rails.cache.silence!

# override logging for parsing json message
module Logging::Layouts
  class Parseable < ::Logging::Layout

    def format_obj(obj)
      case obj
      when Exception
        h = { :class   => obj.class.name,
              :message => obj.message }
        h[:backtrace] = obj.backtrace if @backtrace && !obj.backtrace.nil?
        h
      when Time
        iso8601_format(obj)
      else
        JSON.parse(obj) rescue obj
      end
    end
  end
end

# override request payload and add more info for lograge
module ActionController
  module Instrumentation
    def append_info_to_payload(payload)
      payload[:view_runtime] = view_runtime
      payload[:request_id]   = request.uuid
      payload[:remote_ip]    = request.remote_ip
      # headers
      payload[:headers] = {}
      payload[:headers][:referer]    = request.headers['Referer']    if request.headers['Referer'].present?
      payload[:headers][:user_agent] = request.headers['User-Agent'] if request.headers['User-Agent'].present?
      # session
      payload[:session] = {}
      payload[:session][:session_id] = session[:session_id]  if session[:session_id].present?
      payload[:session][:csrf_token] = session[:_csrf_token] if session[:_csrf_token].present?
      # params
      parameter_filter = ActionDispatch::Http::ParameterFilter.new([:password])
      filtered_params  = parameter_filter.filter(params).symbolize_keys
      payload[:params] = filtered_params.except(:action, :controller, :utf8)
    end
  end
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

module ActionDispatch
  class DebugExceptions
    def log_error(env, wrapper)
      logger = logger(env)
      return unless logger

      exception = wrapper.exception

      trace = wrapper.application_trace
      trace = wrapper.framework_trace if trace.empty?

      ActiveSupport::Deprecation.silence do
        message = {}
        message[:class] = exception.class.to_s
        message[:message] = exception.message
        message[:annoted_source_code] = exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
        message[:backtrace] = trace
        logger.fatal(message.to_json)
      end
    end
  end
end
