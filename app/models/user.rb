class User < ApplicationRecord
  include UserGroupable
  include UserInvitable
  include UserOmniauth
  include UserProfileable

  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable,
         :invitable, :lockable, :omniauthable, omniauth_providers: [:myzyxel]

  class << self

    def select_options
      Omniauth.includes(:user).all.map do |omniauth|
        [omniauth.user.email, omniauth.uid]
      end
    end

  end

  def lock_status
    if self.access_locked?
      I18n.t('common.labels.lock')
    else
      I18n.t('common.labels.unlock')
    end
  end

end
