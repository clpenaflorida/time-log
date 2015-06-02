class AddFinishAtToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :finish_at, :datetime
  end
end
