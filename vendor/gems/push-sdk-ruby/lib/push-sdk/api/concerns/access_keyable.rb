module Push
  module Api
    module AccessKeyable

      attr_accessor :access_key_id, :private_key

      # 檢查 access_key_id
      def validate_access_key_id
        raise 'Access Key ID is required' unless access_key_id
        true
      end

      # 檢查 private_key
      def validate_private_key
        raise 'Private Key is required' unless private_key
        true
      end
    end
  end
end
