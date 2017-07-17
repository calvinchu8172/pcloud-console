module Push
  class AppGroup
    extend  ActiveModel::Naming
    extend  ActiveModel::Translation
    include ActiveModel::AttributeAssignment
    include ActiveModel::Model

    attr_accessor :app_group_id, :name, :description, :topic_arn, :created_at, :updated_at

    class << self

      def client
        @client ||= AppGroupClient.new
      end

      def all
        response = client.list_app_groups
        response['data'].map do |app_group|
          record = AppGroup.new
          record.assign_attributes(app_group)
          record
        end
      end

      def find(app_group_id)
        response = client.get_app_group(app_group_id: app_group_id)
        record = AppGroup.new
        record.assign_attributes(response['data'])
        record
      end
    end
  end
end
