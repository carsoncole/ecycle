class ChargesController < ApplicationController  
  before_action :require_login, only: [:index, :destroy]

  def index
    @charges = Charge.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @charge = Charge.find(params[:id])
  end

  def new
    if params[:donation_amount]
      @donation_amount = params[:donation_amount].to_i * 100
    else
      @donation_amount = cookies[:donation_amount]
    end
    @pickup = Pickup.find(cookies[:pickup_id]) if cookies[:pickup_id]

    if @pickup
      @email = @pickup.email
    else
      @email = ''
    end
  end

  def create
    # Amount in cents
    @charge = Charge.new
    @amount = cookies[:donation_amount]
    @pickup = Pickup.find(cookies[:pickup_id]) if cookies[:pickup_id]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge.customer_id = customer.id
    @charge.customer_email = customer.email
    @charge.stripe_payment_token = customer.default_source
    @charge.save

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Donation to Bainbridge Is Troop 1496',
      :currency    => 'usd'
    )

    @charge.charge_id = charge.id
    @charge.charge_amount = charge.amount
    @charge.charge_description = charge.description
    @charge.pickup_id = @pickup.id if @pickup
    @charge.charge_paid = charge.paid
    @charge.save

    redirect_to thank_you_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to charges_path, notice: 'Donation was destroyed.'
  end

end
