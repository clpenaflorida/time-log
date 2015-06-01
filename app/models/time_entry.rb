class TimeEntry < ActiveRecord::Base
	belongs_to :user
	has_many :user_settings, through: :user, autosave: false
  has_many :companies, through: :user 

	before_save :status, :hours_worked

  def status

    if (starts_at.present?) && (finish_at.present?)
     
      total_hours_worked = finish_at - starts_at

      total_hours_worked /= 3600
      user_setting = UserSetting.find_by(name: name, user_id: user_id)
      
      puts setting = user_setting.setting
      puts name = user_setting.name
      puts req_hr = user_setting.required_hours
      
      req_hr = user_setting.required_hours if user_setting.present?

      if req_hr.present? && (setting=="Allowed")
        if total_hours_worked < req_hr

          self.status = "pending"

        elsif total_hours_worked >= req_hr
          self.status = "default"
        end
      end
    end
  end

  def hours_worked

    total_hours_worked = finish_at - starts_at

    total_hours_worked /= 3600

    self.hours_worked = total_hours_worked.floor
  end
end
