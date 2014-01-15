class UsersController < ApplicationController
  def index
    #search
    if params[:search]
      @user = User.search(params[:search])
    else
      @user = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Rate Date!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
    end
end
