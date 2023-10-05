class PostsController < ApplicationController
  # GET /users/:user_id/posts
  def index
    @posts = Post.all
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = Post.where(author_id: user_id)
  end

  # GET /users/:user_id/posts/:id
  def show
    params[:id]
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = Post.find(post_id)
    @comments = Comment.where(post_id:)
  end
end
