class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:index]

  # GET /pickups
  def index
    @pickups = Pickup.page(params[:page]).per(25)
  end

  # GET /pickups/1s
  def show
  end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
  end

  # GET /pickups/1/edit
  def edit
  end

  # POST /pickups
  def create
    @pickup = Pickup.new(pickup_params)

    if @pickup.save
      redirect_to new_pickup_donation_path(@pickup), notice: "<h4 class='alert-heading'>Well done!</h4>We've scheduled a pickup of your e-waste! Boy Scouts from our Troop will be picking up between 8am and 2pm on Saturday, June 2. Please have your e-waste outside on your curb, house porch, or in front of your garage or front door. Thanks again!"
      cookies[:pickup_id] = @pickup.id
    else
      render :new
    end
  end

  # PATCH/PUT /pickups/1
  def update
    if @pickup.update(pickup_params)
      redirect_to @pickup, notice: 'Pickup was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pickups/1
  def destroy
    @pickup.destroy
    cookies.delete :pickup_id
    redirect_to root_path, notice: 'Pickup was successfully destroyed.'
  end

  def deliver
    DriverMailer.pickups(params[:driver_id]).deliver_now
    redirect_to drivers_path, notice: 'Drive was emailed their pickups.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pickup_params
      params.require(:pickup).permit(:name, :email, :street_address, :driver_id, :message, :size)
    end
end
