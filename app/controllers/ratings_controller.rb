class RatingsController < ApplicationController
  def new
	@title = "Create a Rating"
	@rating = Rating.new
  end
  
  def create
    @rating = current_user.ratings.build(params[:rating)
    if @comment.save
      flash[:success] = "Rating created!"
      redirect_to @rating
    else
      @title = "Create Rating"
      render 'new'
    end
  end

end
