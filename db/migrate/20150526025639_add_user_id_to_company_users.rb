class AddUserIdToCompanyUsers < ActiveRecord::Migration
  def change
    add_column :company_users, :user_id, :integer
  end
end
