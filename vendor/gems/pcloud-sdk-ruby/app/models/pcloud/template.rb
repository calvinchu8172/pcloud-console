module Pcloud
  class Template < ApplicationModel

    permit_primary_key :identity
    permit_attributes  :identity, :created_at, :updated_at, :id, :title_en, :content_en,
      :template_id, :locale, :title, :content, :'title_zh-TW', :'content_zh-TW'

    validates :identity, presence: true
    # validates :redirect_uri, presence: true
    # validates :create_table, presence: true, on: :create

    class << self

      def all
        client = TemplateClient.new
        response = client.list_templates
        response['data'].map do |template|
          record = Template.new
          record.assign_attributes(template)
          record
        end
      end

      def find(identity)
        client = TemplateClient.new
        response = client.get_template(identity: identity)
        # record = Template.new
        # binding.pry
        # record.assign_attributes(response['data'])
        # record
        response['data'].map do |template|
          record = Template.new
          record.assign_attributes(template)
          record
        end
      end

    end # class << self


    def destroy!
      client = Template.new
      client.delete_template(attributes)
    end

    def save
      run_callbacks :save do
        if valid?
          client = TemplateClient.new
          response = if new_record?
            client.create_template(attributes)
          else
            client.put_template(attributes)
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
