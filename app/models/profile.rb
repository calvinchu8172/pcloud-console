class Profile < ApplicationRecord

  strip_attributes

  default_value_for :super_admin, false

  belongs_to :user

  scope :super_admin, -> { where(super_admin: true) }
  scope :not_super_admin, -> { where(super_admin: false) }

end
