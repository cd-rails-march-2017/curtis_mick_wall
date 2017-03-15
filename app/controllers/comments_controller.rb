class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new(content:params[:content], post: Post.find(params[:post]), user:User.find(session[:user]))
    if @comment.valid?
      @comment.save
      redirect_to '/'
    else
      redirect_to '/', alert: "YOU GOT A PRObLEM"
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/'
  end
end
