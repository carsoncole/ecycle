class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
    @pickups_start_at = settings.pickups_start_at
    @pickups_end_at = settings.pickups_end_at
    @dropoffs_start_at = settings.dropoffs_start_at
    @dropoffs_end_at = settings.dropoffs_end_at
  end

  def about
  end
end
