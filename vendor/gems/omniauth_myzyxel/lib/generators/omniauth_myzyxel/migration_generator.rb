require 'rails/generators/active_record'

module OmniauthMyzyxel
  module Generators
    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      desc 'Installs Omniauth myZyxel migration file.'

      def install
        migration_template 'create_omniauths.rb', 'db/migrate/create_omniauths.rb'
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end
    end
  end
end
