class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
