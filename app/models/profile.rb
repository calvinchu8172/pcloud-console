class Profile < ActiveRecord::Base

  strip_attributes

  # enum role: { anonymous: 0, user_manager: 1, app_manager: 2, content_manager: 3, super_admin: 99 }
  # enum role: { user_manager: 0, app_manager: 1, content_manager: 2, super_admin: 99 }

  default_value_for :super_admin, false
  # default_value_for :role, 'app_manager'

  belongs_to :user

  # validates :role, presence: true

  scope :super_admin, -> { where(super_admin: true) }
  scope :not_super_admin, -> { where(super_admin: false) }

  class << self

    # 多國語言化的 role select options
    # def role_select_options
    #   self.roles.keys.reject{ |role|
    #     role == 'super_admin'
    #   }.map do |role|
    #     [Profile.human_attribute_name("role.#{role}"), role]
    #   end
    # end
  end
end
