class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :time_entries
	has_many :user_settings
	has_many :company_users
	has_many :companies, through: :company_users

	accepts_nested_attributes_for :companies

	def check_if_company_exists (domain)

		company = Company.find_by_domain(domain)
		
		if company.present?

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