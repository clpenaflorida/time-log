class AddStatusToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :status, :string
  end
end
