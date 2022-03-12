class AuthController < ApplicationController
  def index
  end

  def new
  end

  def signup
    user = User.new
    user.name = params[:name]
    user.password = params[:password]
    if user.valid? && user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to new_auth_path, notice: 'Invalid username or password'
    end
  end

  def signin
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/auth', notice: 'Invalid username or password'
    end
  end
end
