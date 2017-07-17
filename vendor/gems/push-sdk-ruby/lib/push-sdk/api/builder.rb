module Push
  module Api
    class Builder

      class << self
        def build(swagger_yml)
          Builder.new.build(swagger_yml)
        end
      end

      def build(swagger_yml)
        # 載入 swagger yml
        swagger = YAML.load_default(swagger_yml)
        # 初始化 api 為 Hash object
        api = {}
        # 將 swagger paths 轉換成 api settings
        swagger['paths'].each do |path, path_methods|
          path_methods.each do |method, method_settings|
            # 初始化 api_settings 為 Hash object
            api_settings = {}
            # 取得 uri scheme
            api_settings[:scheme] = swagger['schemes'][0]
            # 設定 api path
            api_settings[:path] = path
            # 設定 api method
            api_settings[:method] = method.to_sym
            # 設定 api parameters
            api_settings[:parameters] = method_settings['parameters']
            # 設定 api header content_type
            if method_settings['consumes'] && method_settings['consumes'].present?
              api_settings[:content_type] = method_settings['consumes'][0]
            end
            # 設定 api header Accept
            if method_settings['produces'] && method_settings['produces'].present?
              api_settings[:accept] = method_settings['produces'][0]
            end
            # 新增至 api operations
            api[method_settings['operationId'].to_sym] = api_settings
          end
        end
        # 返回
        api
      end
    end
  end
end
