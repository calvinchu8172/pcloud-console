Rails.application.configure do
  config.slack = config_for(:slack).deep_symbolize_keys
end

class SlackNotifier

  attr_accessor :webhook_url, :channel, :username, :event, :status, :fields

  # 初始化
  def initialize(event, status = :success)
    @fields = []
    @status = status

    add_field('Event', event, true)
    add_field('Time', Time.now.utc, true)
  end

  def webhook_url
    @webhook_url ||= Rails.configuration.slack[:webhook_url]
  end

  def channel
    @channel ||= Rails.configuration.slack[:channel]
  end

  def username
    @username ||= "#{App.stack_env}.#{App.hostname}"
  end

  # 進行通知
  def notify!
    add_field('App Version', App.full_version)
    RestClient.post(webhook_url, payload: data.to_json)
  end

  # payload: data
  def data
    {
      channel: channel,
      username: username,
      attachments: attachments
    }
  end

  # payload: attachments
  def attachments
    [
      {
        color: color,
        fields: fields
      }
    ]
  end

  # payload: color
  def color
    case status
    when :success then 'good'
    when :error   then 'danger'
    when :warning then 'warning'
    end
  end

  # append payload: fields
  def add_field(title, value, short = false)
    fields << { title: title, value: value, short: short }
  end
end
