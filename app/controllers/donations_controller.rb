class DonationsController < ApplicationController

  def new
    cookies[:pickup_id] = params[:pickup_id] if params[:pickup_id]
  end


  def create
    cookies[:donation_amount] = (params[:amount].gsub(',','').gsub('$','').to_i * 100)
    redirect_to new_charge_path
  end

end
