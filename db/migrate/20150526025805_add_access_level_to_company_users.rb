class AddAccessLevelToCompanyUsers < ActiveRecord::Migration
  def change
    add_column :company_users, :access_level, :integer
  end
end
