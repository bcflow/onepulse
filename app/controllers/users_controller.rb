class UsersController < ApplicationController

  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def new

  end

  def edit
    
  end

  def history
    @blips = Blip.all
    @sentences = Sentence.all
  end

  def update
    if @user.update user_params
      flash[:success] = "Your profile was successfully edited."
      redirect_to root_path
    else
      flash.now[:alert] = "Your user profile was not updated"
      render :edit
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash.now[:alert] = "There was a problem creating your account. Please try again."
      render :new
    end
  end

  private

  def logged_in_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, 
                                 :age, :name, :city, :gender, :country)
  end

end
