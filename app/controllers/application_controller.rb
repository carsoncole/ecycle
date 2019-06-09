# TODO Investigate why Setting not instantiated in production
# TODO Refactor README.md
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  helper_method :valid_pickup_exists?
  helper_method :current_pickup
  helper_method :settings

  def current_pickup
    if cookies[:pickup_id] 
      @current_pickup ||= Pickup.find(cookies[:pickup_id]) rescue nil
    end
  end

  # Check for presence of a valid pickup/key cookie combination
  def valid_pickup_exists?
    if cookies[:pickup_id] && cookies[:key]
      pickup = Pickup.where(id: cookies[:pickup_id]).first
      if pickup && pickup.key == cookies[:key]
        true
      else
        delete_pickup_cookies!
        false
      end
    else
      false
    end
  end

  # Set cookies identifying users pickup
  def set_pickup_cookies!
    if @pickup
      cookies[:pickup_id] = @pickup.id
      cookies[:key] = @pickup.key
    elsif params[:pickup_id] && params[:key]
      cookies[:pickup_id] = params[:pickup_id]
      cookies[:key] = params[:key]
    end
  end

  def delete_pickup_cookies!
    cookies.delete :pickup_id
    cookies.delete :key
  end 

  def require_valid_cookies
    return if signed_in?
    if @pickup
      if @pickup && ( @pickup.key == cookies[:key] || @pickup.key == params[:key] )
        set_pickup_cookies!
        return
      end
      delete_pickup_cookies!
      redirect_to root_path
    end
  end

  def settings
    Setting.last ? Setting.last : Setting.create
  end
end