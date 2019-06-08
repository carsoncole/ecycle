class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
    @settings = Setting.find_or_create_by(id: 1)
    @pickups_start_at = @settings.pickups_start_at
    @pickups_end_at = @settings.pickups_end_at
    @dropoffs_start_at = @settings.dropoffs_start_at
    @dropoffs_end_at = @settings.dropoffs_end_at
  end

  def about
  end
end
