class CommentsController < ApplicationController
  
  def show
  end

  def new
  end

  def create
    if params[:link_id]
      @commentable = Link.find(params[:link_id])
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
    @comment = Comment.new(params[:comment])
    @comment.commentable = @commentable
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to link_path(@commentable)
    else
      redirect_to link_path(@commentable), :alert => "Comment can't be blank."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
