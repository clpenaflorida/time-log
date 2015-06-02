class AddFirstNameToCompanyUsers < ActiveRecord::Migration
  def change
    add_column :company_users, :first_name, :string
  end
end
