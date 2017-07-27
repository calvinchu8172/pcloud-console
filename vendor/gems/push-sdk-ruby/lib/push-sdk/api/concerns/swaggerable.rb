module Push
  module Api
    module Swaggerable

      attr_accessor :scheme, :host, :path, :method, :content_type, :accept, :parameters

      # 檢查 parameters
      def validate_parameters
        parameters.select{ |x| x['in'] != 'header' }.each do |x|
          if x['required'] == true && !instance_variable_get("@#{x['name']}")
            raise "#{x['name']} is required"
          end
        end
        true
      end

      def host
        ENV['PUSH_HOST']
      end

      # 取得 path
      def path
        @path.gsub(/{[a-z_]+}/){ |match| instance_variable_get("@#{match[1..-2]}") }
      end

      # 取得 base_url
      def base_url
        "#{scheme}://#{host.gsub(/\/+/, '/')}".sub(/\/+\z/, '')
      end

      # 取得 url
      def url
        @url ||= URI.encode("#{base_url}#{path}")
      end

      # 取得 timestamp: 目前時間 + 900s
      def timestamp
        @timestamp ||= (Time.now.utc + 900).to_i
      end

      # 取得 signature_data_keys
      def signature_data_keys
        @signature_data_keys ||= parameters.select{ |x|
          x['in'] != 'header'
        }.map{ |x| x['name'] }
      end

      # 取得產生 signature 用的 data
      def signature_data
        @signature_data = {}
        signature_data_keys.each{ |key|
          @signature_data[key] = instance_variable_get("@#{key}")
        }
        @signature_data['X-Eco-Timestamp'] = timestamp
        @signature_data
      end

      # 產生 signature
      def signature
        @signature ||= Signature.generate(private_key, signature_data)
      end

      # 取得 header_keys
      def header_keys
        @header_keys ||= parameters.select{ |x|
          x['in'] == 'header'
        }.map{ |x| x['name'] }
      end

      # 取得 headers
      def headers
        @headers = {
          'X-Eco-Timestamp' => timestamp,
          'X-Eco-Signature' => signature
        }
        @headers['X-Api-Key'] = ENV['PUSH_API_KEY'] if 'X-Api-Key'.in?(header_keys)
        @headers[:content_type] = content_type if content_type
        @headers[:accept] = accept if accept
        @headers
      end

      # 取得 form_data_keys
      def form_data_keys
        @form_data_keys ||= parameters.select{ |x|
          x['in'] == 'formData'
        }.map{ |x| x['name'] }
      end

      # 根據 form_data_keys 取得 form_data
      def form_data
        if form_data_keys.present?
          @form_data = {}
          form_data_keys.each { |key|
            @form_data[key] = instance_variable_get("@#{key}")
          }
        end
        @form_data
      end

      # 取得 query_string_keys
      def query_string_keys
        @query_string_keys ||= parameters.select{ |x|
          x['in'] == 'query'
        }.map{ |x| x['name'] }
      end

      # 根據 query_string_keys 取得 form_data
      def query_strings
        if query_string_keys.present?
          @query_strings = {}
          query_string_keys.each { |key|
            @query_strings[key] = instance_variable_get("@#{key}")
          }
        end
        @query_strings
      end

      # 組合 rest_client_options
      def rest_client_options
        @rest_client_options = {
          url: url,
          method: method,
          headers: headers,
        }
        if method == :get && query_strings
          @rest_client_options[:url] = "#{url}?#{query_strings.to_query}"
        end
        if content_type == 'application/x-www-form-urlencoded'
          @rest_client_options[:payload] = form_data
        end
        @rest_client_options
      end
    end
  end
end
