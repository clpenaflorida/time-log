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

	before_create :check_if_company_exists

	def check_if_company_exists

		company = self.companies.first
		puts company.domain

		this_domain = Company.find_by_domain(company.domain)

		if this_domain.present?
			puts = "----------------------------------------------"
			puts company.domain + " Domain already exists "

			self.access_level = 2
		else 
			puts = "----------------------------------------------"
			puts company.domain + " Domain does not exists "
			self.access_level = 1
			
		end
	end


end