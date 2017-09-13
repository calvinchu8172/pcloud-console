module Pcloud
  class SsoApp < ApplicationModel

    permit_primary_key :client_id
    permit_attributes  :client_id, :name, :redirect_uri, :scopes,
      :logout_redirect_uri, :create_db, :created_at, :updated_at

    validates :name, presence: true

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

      def find(client_id)
        client = SsoAppClient.new
        response = client.get_sso_app(client_id: client_id)
        record = SsoApp.new
        record.assign_attributes(response['data'])
        record
      end
    end # class << self

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
    end # save

  end
end
