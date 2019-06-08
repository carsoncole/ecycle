class SettingsController < ApplicationController
  before_action :require_login
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  def index
    redirect_to setting_path(:first)
  end

  # GET /settings/1
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to @setting, notice: 'Setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to @setting, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    redirect_to settings_url, notice: 'Setting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.first_or_create
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:dropoff_start_date, :dropoff_end_date, :pickup_start_date, :pickup_end_date, :pickup_instructions, :pickup_signups_enabled, :pickup_contact_name, :pickup_contact_email, :general_contact_name, :general_contact_email, :donations_enabled, :allow_user_signups, :pickups_start_at, :pickups_end_at, :dropoffs_start_at, :dropoffs_end_at, :send_admin_pickup_notifications, :event_date, :dropoff_location, :brief_marketing_message)
    end
end
