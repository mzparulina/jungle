class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    # Save session in server, the redirect to homepage
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
