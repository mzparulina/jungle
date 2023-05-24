class UsersController < ApplicationController
  def index
  end

  def create
    user_params[:email] = user_params[:email].downcase.strip
    @user = User.new(user_params)

    # Save session in server, the redirect to homepage
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Successfully created account'
    else
      redirect_to '/signup'
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end