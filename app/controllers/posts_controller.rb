class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user)
  end 

  def new 
    @post = current_user.posts.build
  end 

  def create 
    @post = current_user.posts.build(post_params)
    if @post.save 
      redirect_to @post 
    else 
      render 'new'
    end
  end 

  def show 
    @post = Post.find(params[:id])
  end 

  private 

  def post_params 
    params.require(:post).permit(:title, :data, :body)
  end 
end
