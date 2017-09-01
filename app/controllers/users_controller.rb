class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Vladimir',
      email: 'xailo@list.ru',
      username: 'vladimir'
    )
  end
end
