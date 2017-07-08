module TimeZone
  extend ActiveSupport::Concern

  included do

    around_action :set_time_zone

    private

    def set_time_zone
      Time.use_zone(time_zone) { yield }
    end

    def client_time_zone
      @client_time_zone ||= cookies[:time_zone]
    end

    def time_zone
      @time_zone ||= if Rails.env.test?
        'Etc/UTC'
      else
        Time.find_zone(client_time_zone) || Time.zone.tzinfo.name
      end
    end
  end
end
