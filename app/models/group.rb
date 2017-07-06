class Group < ApplicationRecord

  has_and_belongs_to_many :users

  class << self

    def select_options
      all.map{ |group| [group.localized_name, group.id] }
    end

    def options
      all.map{ |group| group.localized_name }
    end
  end

  def i18n_name
    self.name.parameterize.underscore
  end

  def localized_name
    I18n.t("group.names.#{self.i18n_name}")
  end
end
