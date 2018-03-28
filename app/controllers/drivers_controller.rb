class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:index]

  # GET /drivers
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to root_path, notice: "<h2>Awesome! You're great!</h2>You are all signed up as a driver. Thank you so much for supporting the Troop and our Scouts. We'll email you your pickup list on June 1."
    else
      render :new
    end
  end

  # PATCH/PUT /drivers/1
  def update
    if @driver.update(driver_params)
      redirect_to @driver, notice: 'Driver was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /drivers/1
  def destroy
    @driver.destroy
    redirect_to drivers_url, notice: 'Driver was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:name, :email, :scout_names)
    end
end
