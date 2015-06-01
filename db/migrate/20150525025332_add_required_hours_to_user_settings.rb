class AddRequiredHoursToUserSettings < ActiveRecord::Migration
  def change
    add_column :user_settings, :required_hours, :integer
  end
end
