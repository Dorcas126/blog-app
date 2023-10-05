class UsersController < ApplicationController
  # GET /users/:user_id/posts
  def index
    @users = User.all
  end

  # GET /users/:user_id/posts/:id
  def show
    params[:id]
    user_id = params[:id].to_i
    @user = User.find(user_id)
    @posts = @user.recent_posts
  end
end
