module UserInvitable
  extend ActiveSupport::Concern

  included do

    def skip_invitation
      true
    end
  end
end
