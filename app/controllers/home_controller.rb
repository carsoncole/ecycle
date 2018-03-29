class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
  end

  def about
  end
end
