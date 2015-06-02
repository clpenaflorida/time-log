class AddHoursWorkedToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :hours_worked, :integer
  end
end
