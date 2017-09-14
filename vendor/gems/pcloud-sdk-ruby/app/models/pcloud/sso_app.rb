module Pcloud
  class SsoApp < ApplicationModel

    permit_primary_key :id
    permit_attributes  :id, :uid, :secret, :name, :redirect_uri, :scopes,
      :logout_redirect_uri, :create_table, :created_at, :updated_at

    validates :name, presence: true
    validates :redirect_uri, presence: true
    validates :create_table, presence: true, on: :create

    class << self

      def all
        client = SsoAppClient.new
        response = client.list_sso_apps
        response['data'].map do |sso_app|
          record = SsoApp.new
          record.assign_attributes(sso_app)
          record
        end
      end

      def find(id)
        client = SsoAppClient.new
        response = client.get_sso_app(id: id)
        record = SsoApp.new
        record.assign_attributes(response['data'])
        record
      end

    end # class << self

    def scopes_break_line
      if !self.scopes.blank?
        self.scopes.join("<br/>").html_safe
      else
        'None'
      end
    end

    def redirect_uris_break_line
      if !self.redirect_uri.blank?
        self.redirect_uri.split("\n").join("<br/>").html_safe
      else
        'None'
      end
    end

    def logout_redirect_uris_break_line
      if !self.logout_redirect_uri.blank?
        self.logout_redirect_uri.split("\n").join("<br/>").html_safe
      else
        'None'
      end
    end

    def destroy
      client = SsoAppClient.new
      client.delete_sso_app(attributes)
      true
    end

    def create_ddb_table
      client = SsoAppClient.new
      client.create_sso_app_table(attributes)
      true
    rescue => e
      self.api_error_message = begin
        JSON.parse(e.response.body)['message']
      rescue
        I18n.t('common.messages.error')
      end
      false
    end


    def save
      run_callbacks :save do
        if valid?
          client = SsoAppClient.new
          response = if new_record?
            client.create_sso_app(attributes)
          else
            client.put_sso_app(attributes)
          end
          assign_attributes(response['data'])
          changes_applied
          true
        else
          false
        end
      end
    rescue => e
      self.api_error_message = begin
        JSON.parse(e.response.body)['message']
      rescue
        I18n.t('common.messages.error')
      end
      false
    end # save

  end
end
