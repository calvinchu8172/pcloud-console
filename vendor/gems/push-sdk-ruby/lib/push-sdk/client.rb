module Push
  class Client

    class << self

      def access_key_id
        raise 'Override this method'
      end

      def private_key
        raise 'Override this method'
      end

      def swagger_yml
        raise 'Override this method'
      end

      def api
        @api ||= Api::Builder.build(swagger_yml)
      end
    end

    # 根據 method_name 取得 api config 並動態產生 api method
    def method_missing(method_name, *arguments, &block)
      if api_config = self.class.api[method_name]
        options = api_config.merge(
          access_key_id: self.class.access_key_id,
          private_key: self.class.private_key
        )
        options.merge!(arguments[0]) if arguments[0]
        operator = Api::Operator.new(options)
        operator.perform!
      else
        super
      end
    end
  end
end
