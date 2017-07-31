module Push
  class ApplicationModel
    extend  ActiveModel::Callbacks
    extend  ActiveModel::Naming
    extend  ActiveModel::Translation
    include ActiveModel::AttributeAssignment
    include ActiveModel::AttributeMethods
    include ActiveModel::Dirty
    include ActiveModel::Model
    include ActiveModel::Serialization

    define_model_callbacks :save
    define_model_callbacks :update

    attr_accessor :api_error_message

    class << self

      attr_accessor :primary_key

      def attribute_keys
        @attribute_keys ||= []
      end

      def permit_attributes(*attribute_keys)
        attr_accessor(*attribute_keys)
        define_attribute_methods(*attribute_keys)
        @attribute_keys = attribute_keys
      end

      def permit_primary_key(column_name)
        @primary_key ||= column_name
      end
    end

    def id
      @id ||= send(self.class.primary_key)
    end

    def to_param
      self.id && self.id.to_s
    end

    def new_record?
      !self.id
    end

    def attributes
      self.class.attribute_keys.map{ |key| [key, send(key)] }.to_h
    end

    def attributes=(params)
      params.each do |key, value|
        value.reject!(&:blank?) if value.is_a? Array
        if key.to_sym.in? self.class.attribute_keys
          send("#{key}_will_change!") unless send(key) == value
        end
        send("#{key}=", value)
      end
    end

    # 1. set attributes with params
    # 2. process save
    def update(params)
      run_callbacks :update do
        self.attributes = params
        save
      end
    end

    def api_error?
      !!@api_error_message
    end
  end
end
