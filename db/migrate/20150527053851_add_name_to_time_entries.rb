class AddNameToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :name, :string
  end
end
