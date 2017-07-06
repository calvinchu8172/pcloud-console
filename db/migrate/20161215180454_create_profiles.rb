class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer    :super_admin, index: true, default: 0
      t.string     :name

      t.timestamps null: false
    end
  end
end
