class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        url = "/road_trips/#{@comment.post.road_trip_id}/"
        format.html { redirect_to url, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:remark, :user_id, :post_id)
    end
end
