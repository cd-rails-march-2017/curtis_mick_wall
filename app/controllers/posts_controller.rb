class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(content:params[:content], user:User.find(session[:user]))
    if @post.valid?
      @post.save
      redirect_to '/'
    else
      redirect_to '/', alert: "YOU GOT A PRObLEM"
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end
end
