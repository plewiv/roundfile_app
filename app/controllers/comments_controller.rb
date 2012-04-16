class CommentsController < ApplicationController
  def new
	@title = "Create a Comment"
	
	if (!params[:message].blank?)
		flash[:error] = "There was an error creating your comment. Please try again."
	end
	
	@comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to "/viewresume/#{@comment.resumeid}"
    else
      @title = "Create Comment"
      redirect_to "/newcomment/#{@comment.resumeid}/error"
	  #render 'new'
    end
  end
  
  def show
	@comment = Comment.find(params[:id])
	
	@title = "Show Comment"
  end

  
end
