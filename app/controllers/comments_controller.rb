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



  
  
  def edit
	@title = "Edit Comment"

    @comment = Comment.find(params[:id])
  end
  
  def update
	@title = "Edit Comment"

    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to("/viewresume/#{@comment.resumeid}", :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

	redirect_to "/viewresume/#{@comment.resumeid}"

  end

  
end
