module UserGroupable
  extend ActiveSupport::Concern

  included do

    has_and_belongs_to_many :groups

    def anonymous?
      self.not_super_admin? && self.groups.blank?
    end
  end
end
