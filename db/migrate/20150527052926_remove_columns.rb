class RemoveColumns < ActiveRecord::Migration
	def self.up
	  remove_column :user_settings, :day
	end

	def self.down
	  add_column :user_settings, :day, :string
	end

	def self.up
	  remove_column :time_entries, :day
	end

	def self.down
	  add_column :time_entries, :day, :string
	end
end
