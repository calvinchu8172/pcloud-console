require 'rails'
require 'push-sdk/utils/yaml'
require 'push-sdk/utils/to_ostruct'
require 'push-sdk/rails'

module Push

  API_DIR = File.join(File.dirname(File.dirname(__FILE__)), 'apis')

  module Api
    # concerns
    autoload :AccessKeyable, 'push-sdk/api/concerns/access_keyable'
    autoload :Swaggerable,   'push-sdk/api/concerns/swaggerable'
    # api core
    autoload :Builder,   'push-sdk/api/builder'
    autoload :Operator,  'push-sdk/api/operator'
    autoload :Signature, 'push-sdk/api/signature'
  end

  # clients
  autoload :Client,         'push-sdk/client'
  autoload :AppGroupClient, 'push-sdk/app_group_client'
end
