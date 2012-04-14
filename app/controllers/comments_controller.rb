class CommentsController < ApplicationController
  def new
	@title = "Create a Comment"
	@comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @comment
    else
      @title = "Create Comment"
      render 'new'
    end
  end
  
end
