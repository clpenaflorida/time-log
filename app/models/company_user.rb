class CompanyUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :company

	before_save :getCompanyUser

	def getCompanyUser
	end
end