class RemoveDayFromTimeEntries < ActiveRecord::Migration
  def change
    remove_column :time_entries, :day, :string
  end
end
