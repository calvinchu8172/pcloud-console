class Omniauth < ApplicationRecord

  belongs_to :user

  class << self
    def uid_select_options
      includes(:user).all.map{ |x| [x.user.email, x.uid] }
    end
  end
end
