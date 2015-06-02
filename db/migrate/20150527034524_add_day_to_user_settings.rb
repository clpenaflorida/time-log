class AddDayToUserSettings < ActiveRecord::Migration
  def change
    add_column :user_settings, :day, :string
  end
end
