class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  # GET /time_entries
  # GET /time_entries.json
  def index
  
    if current_user.present?
    @time_entries = TimeEntry.where(:user_id => current_user.id)
    @cu = CompanyUser.where(:user_id => current_user.id).first
    else 
      @time_entries = TimeEntry.all
    end

  end

  # GET /time_entries/1
  # GET /time_entries/1.json
  def show
   # @cu = CompanyUser.where(:user_id => current_user.id).first
  end

  def login 
    @time_entry = TimeEntry.new
  #  @cu = CompanyUser.where(:user_id => current_user.id).first

  end

  # GET /time_entries/new
  def new
    @time_entry = TimeEntry.new
   # @cu = CompanyUser.where(:user_id => current_user.id).first
  end

  # GET /time_entries/1/edit
  def edit
    @cu = CompanyUser.where(:user_id => current_user.id).first
  end

  # POST /time_entries
  # POST /time_entries.json
  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.user_id = current_user.id
    
    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully created.' }
        format.json { render :show, status: :created, location: @time_entry }
      else
        format.html { render :new }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end

  rescue
   render :json => "The day you chose is not in your list."
    #respond_to do |format|
    #   format.html { render :new }
    #   format.json { render json: @time_entry.errors.add(:name, "You are not allowed to create a time entry in the day you chose." )}
    #end
  end

  # PATCH/PUT /time_entries/1
  # PATCH/PUT /time_entries/1.json
  def update
    
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.json
  def destroy
    @time_entry.destroy
    respond_to do |format|
      format.html { redirect_to time_entries_url, notice: 'Time entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_entry_params
      params.require(:time_entry).permit(:user_id, :starts_at, :finish_at, :name)
    end

end
