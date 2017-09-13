require 'rails'
require 'pcloud-sdk/utils/yaml'
require 'pcloud-sdk/utils/to_ostruct'
require 'pcloud-sdk/rails'

module Pcloud

  API_DIR = File.join(File.dirname(File.dirname(__FILE__)), 'apis')

  module Api
    # concerns
    # autoload :AccessKeyable, 'pcloud-sdk/api/concerns/access_keyable'
    autoload :CertificateSerialable, 'pcloud-sdk/api/concerns/certificate_serialable'
    autoload :Swaggerable,   'pcloud-sdk/api/concerns/swaggerable'
    # api core
    autoload :Builder,   'pcloud-sdk/api/builder'
    autoload :Operator,  'pcloud-sdk/api/operator'
    autoload :Signature, 'pcloud-sdk/api/signature'
  end

  # client
  autoload :Client,          'pcloud-sdk/client'

  # console clients
  autoload :ConsoleClient,   'pcloud-sdk/clients/console_client'
  # autoload :AppGroupClient,  'pcloud-sdk/clients/console/app_group_client'
  # autoload :AccessKeyClient, 'pcloud-sdk/clients/console/access_key_client'
  # autoload :AppClient,       'pcloud-sdk/clients/console/app_client'
  autoload :UserClient,       'pcloud-sdk/clients/console/user_client'
  autoload :DeviceCertClient, 'pcloud-sdk/clients/console/device_cert_client'
  autoload :SsoAppClient, 'pcloud-sdk/clients/console/sso_app_client'

  # notification clients
  # autoload :NotificationClient, 'pcloud-sdk/clients/notification_client'
end
