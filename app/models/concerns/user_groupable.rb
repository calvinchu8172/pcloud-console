module UserGroupable
  extend ActiveSupport::Concern

  included do

    has_many :groups_users
    has_many :groups, through: :groups_users

    def anonymous?
      self.not_super_admin? && self.groups.blank?
    end
  end
end
