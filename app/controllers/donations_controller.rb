class DonationsController < ApplicationController

  def new
    cookies[:pickup_id] = params[:pickup_id] if params[:pickup_id]
  end


  def create
    amount = (params[:amount].gsub(',','').gsub('$','')).to_f
    if amount > 25000 || amount <= 0
      redirect_to new_donation_path
    else
      cookies[:donation_amount] = (amount * 100).to_i
      redirect_to new_charge_path
    end
  end

end
