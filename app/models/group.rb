class Group < ApplicationRecord

  has_many :groups_users
  has_many :users, through: :groups_users

  class << self

    def select_options
      # all.map{ |group| [human_attribute_name("name.#{group.i18n_name}"), group.id] }
      # TODO: 第一個版本隱藏 Push Management
      all.reject{ |group| group.name === 'Push Management' }.map do |group|
        [human_attribute_name("name.#{group.i18n_name}"), group.id]
      end
    end
  end

  def i18n_name
    self.name.parameterize.underscore
  end
end
