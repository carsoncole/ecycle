class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
    cookies.delete(:pickup_id) if signed_in?
  end

  def about
  end
end
