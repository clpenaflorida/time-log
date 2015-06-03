class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :time_entries
	has_many :user_settings
	has_many :company_users, autosave: false
	has_many :companies, through: :company_users
	#accepts_nested_attributes_for :companies,:company_users

	 #before_create:check_if_company_exists


	def check_if_company_exists (company_att)

		company = Company.find_or_create_by(domain: company_att[:domain]) do |c|
			c.name = company_att[:name]
		end
		return company
	end

	def check_what_access_level (company_users)
		if company_users.count > 0

			puts = "----------------------------------------------"
			puts " Domain already exists "
			access_level = 2

		else 
			puts = "----------------------------------------------"
			puts " Domain does not exists "
			access_level = 1

		end

		return access_level
	end


end