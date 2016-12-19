class User < ApplicationRecord
  include UserProfileable

  # Include default devise modules. Others available are:
  # :lockable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable

  # 使用者登入紀錄
  def after_database_authentication
    Log.write(self, self, 'user_signed_in', nil)
  end
end
