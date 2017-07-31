module Push
  module Api
    module AccessKeyable

      attr_accessor :client, :access_key_id, :private_key

      # 檢查 access_key_id
      def validate_access_key_id
        raise 'Access Key ID is required' unless client.access_key_id
        true
      end

      # 檢查 private_key
      def validate_private_key
        raise 'Private Key is required' unless client.private_key
        true
      end

      # 配置 access_key_id
      def assign_access_key_id
        self.access_key_id = client.access_key_id
      end
    end
  end
end
