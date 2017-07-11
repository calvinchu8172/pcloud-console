class User < ApplicationRecord
  include UserGroupable
  include UserInvitable
  include UserOmniauth
  include UserProfileable

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable,
         :timeoutable, :invitable, :lockable,
         :omniauthable, omniauth_providers: [:myzyxel]

  # 使用者登入紀錄
  def after_database_authentication
    Log.write(self, self, self.current_sign_in_ip, 'user_sign_in')
  end

  def lock_status
    if self.access_locked?
      I18n.t('common.labels.lock')
    else
      I18n.t('common.labels.unlock')
    end
  end
end
