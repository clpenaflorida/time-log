class AddSettingToUserSettings < ActiveRecord::Migration
  def change
    add_column :user_settings, :setting, :string
  end
end
