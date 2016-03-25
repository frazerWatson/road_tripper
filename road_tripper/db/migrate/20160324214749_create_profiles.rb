class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :hometown
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
