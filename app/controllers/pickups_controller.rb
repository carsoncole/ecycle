# TODO Add key for viewing a pickup
class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:index]

  # GET /pickups
  def index
    @pickups = Pickup.page(params[:page]).per(25)
  end

  # GET /pickups/1s
  def show
    unless signed_in?
      unless @pickup.key == params[:key]
        redirect_to root_path
      end
    end
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
    @pickup.key = [*('a'..'z'),*('0'..'9')].shuffle[0,12].join

    if @pickup.save
      cookies[:pickup_id] = @pickup.id
      cookies[:key] = @pickup.key
      PickupMailer.pickup_scheduled(@pickup.id).deliver_now
      redirect_to new_donation_path(pickup_id: @pickup), notice: "<h4 class='alert-heading'>Well done!</h4><p>We've scheduled a pickup of your e-waste! Boy Scouts from our Troop will be picking up between 8am and 2pm on Saturday, June 2. Please have your e-waste outside on your curb, house porch, or in front of your garage or front door. Thanks again!</p><hr><h4>Will you consider making a donation?</h4><p>Donations go a long way towards supporting our Troop, our Boy Scouts, and the many community service projects they engage in.</p>"
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
    @pickup.charges.update_all(pickup_id: nil)
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
      unless signed_in?
        cookies[:pickup_id] = @pickup.id
      end
    end

    # Only allow a trusted parameter "white list" through.
    def pickup_params
      params.require(:pickup).permit(:name, :email, :street_address, :driver_id, :message, :size)
    end
end
