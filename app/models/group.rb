class Group < ApplicationRecord

  has_and_belongs_to_many :users

  class << self

    def select_options
      all.map{ |group| [human_attribute_name("name.#{group.i18n_name}"), group.id] }
    end
  end

  def i18n_name
    self.name.parameterize.underscore
  end
end
