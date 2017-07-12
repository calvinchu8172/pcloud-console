class Group < ApplicationRecord

  has_many :groups_users
  has_many :users, through: :groups_users

  class << self

    def select_options
      all.map{ |group| [human_attribute_name("name.#{group.i18n_name}"), group.id] }
    end
  end

  def i18n_name
    self.name.parameterize.underscore
  end
end
