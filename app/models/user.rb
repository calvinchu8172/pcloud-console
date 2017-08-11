class User < ApplicationRecord
  include UserDeIdentifiable
  include UserGroupable
  include UserInvitable
  include UserOmniauth
  include UserProfileable

  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable,
         :invitable, :lockable, :omniauthable, omniauth_providers: [:myzyxel]

  def lock_status
    if self.access_locked?
      I18n.t('common.labels.lock')
    else
      I18n.t('common.labels.unlock')
    end
  end
end
