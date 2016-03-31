class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.post.road_trip
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:remark, :user_id, :post_id)
  end
end