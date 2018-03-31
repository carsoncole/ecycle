class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
    if signed_in?
      cookies.delete(:pickup_id) 
      cookies.delete(:key)
    end
  end

  def about
  end
end
