class CompaniesController < ApplicationController
 before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
	
	def index
	    @companies = Company.all
	end

	def new
	   @company = Company.new
	end

	def create
	   @company = Company.new(company_params)
	 
	   respond_to do |format|
	     if @time_entry.save
	       format.html { redirect_to @company, notice: 'Company was successfully created.' }
	       format.json { render :show, status: :created, location: @company }
	     else
	       format.html { render :new }
	       format.json { render json: @time_entry.errors, status: :unprocessable_entity }
	     end
	   end
	 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params[:user].require(:company).permit(:domain, :name)
    end

end