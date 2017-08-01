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

  # client
  autoload :Client,          'push-sdk/client'

  # console clients
  autoload :ConsoleClient,   'push-sdk/clients/console_client'
  autoload :AppGroupClient,  'push-sdk/clients/console/app_group_client'
  autoload :AccessKeyClient, 'push-sdk/clients/console/access_key_client'
  autoload :AppClient,       'push-sdk/clients/console/app_client'

  # notification clients
  autoload :NotificationClient, 'push-sdk/clients/notification_client'
end
