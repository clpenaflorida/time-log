class AddAdminIdToUserSettings < ActiveRecord::Migration
  def change
    add_column :user_settings, :admin_id, :integer
  end
end
