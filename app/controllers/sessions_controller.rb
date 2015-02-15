class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action      :first_user, except: :new
  #
  # GET /login
  #
  def new
    if session[:user_id] && user = User.find_by(id: session[:user_id])
      redirect_to admin_url, notice: "User #{user.user_name} already logged in."
    end
  end
  #
  # POST /login
  #
  def create
    user = User.find_by(user_name: params[:user_name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, notice: "Incorrect user name or password."
    end
  end
  #
  # DELETE /logout
  #
  def destroy
    session[:user_id] = nil
    session[:logout_time] = Time.now
    redirect_to admin_url, notice: "User logged out."
  end

  private
  #
  # Create new user if there ara no users.
  #
  def first_user
    if User.count.zero?
      user = User.create(user_name: params[:user_name], password: params[:password])
    end
  end
end
