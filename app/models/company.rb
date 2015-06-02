class Company < ActiveRecord::Base
	
	has_many :company_users	
	has_many :users, through: :company_users

	accepts_nested_attributes_for :users

  before_save :to_lower_case

  def to_lower_case
     self.domain = self.domain.downcase
  end
  
end