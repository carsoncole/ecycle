class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
  end

  def about
  end

  def logout
    cookies.delete :user
    redirect_to root_path
  end
end
