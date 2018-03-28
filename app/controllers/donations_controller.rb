class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :set_pickup, only: [:new, :show, :edit, :update, :destroy, :create]
  before_action :require_login

  # GET /donations
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)
    @donation.pickup = @pickup
    if @donation.save
      redirect_to root_path, notice: 'Thank you for your donation.'
    else
      render :new
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
    redirect_to donations_url, notice: 'Donation was successfully destroyed.'
  end

  private
    def set_pickup
      @pickup = Pickup.find(params[:pickup_id])
    end


    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def donation_params
      params.require(:donation).permit(:pickup_id, :amount)
    end
end
