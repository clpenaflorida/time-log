class AddCompanyIdToCompanyUsers < ActiveRecord::Migration
  def change
    add_column :company_users, :company_id, :integer
  end
end
