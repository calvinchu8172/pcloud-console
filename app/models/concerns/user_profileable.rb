module UserProfileable
  extend ActiveSupport::Concern

  included do

    has_one :profile, dependent: :destroy

    accepts_nested_attributes_for :profile

    scope :super_admin, -> {
      joins(:profile).merge(Profile.super_admin)
    }
    scope :not_super_admin, -> {
      joins(:profile).merge(Profile.not_super_admin)
    }

    before_create do
      build_profile unless self.profile
    end

    def super_admin!
      self.profile.update(super_admin: true)
    end

    def super_admin?
      self.profile.super_admin?
    end

    def not_super_admin?
      !super_admin?
    end

    def name
      self.profile.name || self.email.split(/@/).first
    end
  end
end
