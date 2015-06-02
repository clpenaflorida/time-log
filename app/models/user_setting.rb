class UserSetting < ActiveRecord::Base
	belongs_to :user
	has_many :time_entries, through: :user

end
