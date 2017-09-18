class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticate_before_create

  private

  def current_user
    @currrent_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'У вас нет прав на это действие'
  end
end
