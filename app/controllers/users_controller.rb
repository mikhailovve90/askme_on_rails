class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installerro',
        email: 'installerro@mail.ru',
        avatar_url: 'http://illjuzija.ru/wp-content/uploads/2012/05/kartinka-so-skrytym-licom.jpg'
      ),
      User.new(
        id: 2,
        name: 'Misha',
        username: 'aristofun',
        email: 'aristofun@mail.ru'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Vladimir',
      email: 'xailo@list.ru',
      username: 'vladimir',
      # avatar_url: 'http://illjuzija.ru/wp-content/uploads/2012/05/kartinka-so-skrytym-licom.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2017')),
      Question.new(text: 'Читал "Государство"" Платона?', created_at: Date.parse('27.04.2017'))
    ]

    @new_question = Question.new
  end
end
