# OPTIMIZE Driver selection dropdown needs format improvement
class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:index]
  before_action :require_valid_cookies, only: [:show, :edit, :update, :destroy]

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
      set_pickup_cookies!
      PickupMailer.pickup_scheduled(@pickup.id).deliver_now
      redirect_to new_donation_path(pickup_sign_up: true), notice: "<p>We've scheduled a pickup of your e-waste! Boy Scouts from our Troop will be picking up between 8am and 2pm on Saturday, June 2. Please have your e-waste outside on your curb, house porch, or in front of your garage or front door. Thanks again!</p><hr><h4>Would you like to make a donation?</h4><p>Donations go a long way towards supporting our Troop, our Boy Scouts, and the many community service projects they engage in. See below recommended amounts based on the quantity of e-waste you want recycled.</p>"
    else
      render :new
    end
  end

  def update
    if @pickup.update(pickup_params)
      redirect_to pickup_path(@pickup), notice: 'Pickup was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pickups/1
  def destroy
    @pickup.charges.update_all(pickup_id: nil)
    @pickup.destroy
    delete_pickup_cookies!
    redirect_to root_path, notice: 'Your pickup was cancelled.'
  end

  def deliver
    DriverMailer.pickups(params[:driver_id]).deliver_now
    redirect_to drivers_path, notice: 'Driver was emailed their pickups.'
  end

  def deliver_all
    Driver.all.each do |driver|
      DriverMailer.pickups(driver.id).deliver_now
    end
    redirect_to drivers_path, notice: 'All drivers were emailed their pickups.'
  end

  private
    def set_pickup
      @pickup = Pickup.find(params[:id]) rescue nil
      unless @pickup
        redirect_to root_path, notice: '<h4>Ooops! That pickup does not exist</h3>It has either been cancelled or never existed.' 
      end
    end

    def pickup_params
      params.require(:pickup).permit(:name, :email, :street_address, :driver_id, :message, :size, :latitude, :longitude)
    end
end