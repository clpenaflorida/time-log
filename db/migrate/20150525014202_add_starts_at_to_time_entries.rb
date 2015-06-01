class AddStartsAtToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :starts_at, :datetime
  end
end
