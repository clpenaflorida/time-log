class RegistrationsController < Devise::RegistrationsController
 
  def new
    build_resource({})
    self.resource.companies.build
    respond_with self.resource
  end

  def create
    super
  end
 
  private
 
  def sign_up_params
    allow = [:email, :password, :password_confirmation, :first_name, :last_name, :date_of_birth, :access_level, [companies_attributes: [:name, :domain]]]
    params.require(resource_name).permit(allow)
  end
 
end