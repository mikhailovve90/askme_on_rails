class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь успешно зарегестрирован'
    end
  end


  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :username, :password, :password_confirmation, :avatar_url)
  end
end
