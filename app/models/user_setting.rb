class UserSetting < ActiveRecord::Base
	belongs_to :user
	has_many :time_entries, through: :user


  #VALIDATIONS
  validates :required_hours, presence:true
  validates :user_id, presence:true
end
