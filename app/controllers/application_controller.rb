class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  protected
  #
  # Restrict access for unauthorized users.
  #
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to admin_url, notice: "Opps, looks like You're not logged in!"
    end
  end
end
