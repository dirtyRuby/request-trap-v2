class AdminController < ApplicationController
  skip_before_action :authorize
  #
  # Show current time
  #
  def clock
    @time = Time.now.strftime("%F %T")
    render partial: 'admin/time', remote: true
  end
  #
  # GET/admin
  #
  def index
    unless session[:logout_time].nil?
      @new_traps = Trap.where("created_at > ?", session[:logout_time].to_datetime)
    else
      @new_traps = {}
    end
  end
end
