class AddLastNameToCompanyUsers < ActiveRecord::Migration
  def change
    add_column :company_users, :last_name, :string
  end
end
