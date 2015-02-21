class UsersController < ApplicationController

  def new

  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash.now[:alert] = "There was a problem creating your account. Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
