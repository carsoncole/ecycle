class HomeController < ApplicationController
  def index
    @pickup = Pickup.new
    @pickups_start_at = Setting.last.pickups_start_at
    @pickups_end_at = Setting.last.pickups_end_at
    @dropoffs_start_at = Setting.last.dropoffs_start_at
    @dropoffs_end_at = Setting.last.dropoffs_end_at
  end

  def about
  end
end
