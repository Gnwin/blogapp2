class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end
end
