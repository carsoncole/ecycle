class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :login

  def login
    cookies[:user] = 'admin' if ['drivers', 'pickups'].include?(controller_name) && action_name == 'index'
  end
end