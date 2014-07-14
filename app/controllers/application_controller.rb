class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  def follow
    current_user.companies << Company.find(params[:id]) unless current_user.companies.include?(Company.find(params[:id]))
    redirect_to :back
  end

  def unfollow
    current_user.companies.delete(params[:id])
    redirect_to :back
  end

  private

  def current_user
    User.find_by(id: session[:current_user]) if session[:current_user]
  end

  def authenticate
    redirect_to login_path unless current_user
  end

  def authorize
    unless current_user && current_user.id == params[:id].to_i
      redirect_to users_path
    end
  end

end
