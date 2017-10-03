module QuestionsHelper
  def add_author
    if current_user.present?
      @question.author = current_user
    else
      @question.author = nil
    end
  end
end
