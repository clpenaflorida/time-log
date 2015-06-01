class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
