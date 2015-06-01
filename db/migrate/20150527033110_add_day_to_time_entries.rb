class AddDayToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :day, :string
  end
end
