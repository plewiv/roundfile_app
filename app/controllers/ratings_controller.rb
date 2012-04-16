class RatingsController < ApplicationController
  def new
	@title = "Create a Rating"
	
	if (!params[:message].blank?)
		flash[:error] = "There was an error adding your rating. Please try again."
	end
	
	@rating = Rating.new
  end
  
  def create
    @rating = current_user.ratings.build(params[:rating])
    if @rating.save
      flash[:success] = "Rating created!"
      redirect_to "/viewresume/#{@rating.resumeid}"
	else
      @title = "Create Rating"
	  redirect_to "/newrating/#{@rating.resumeid}/error"
      #render 'new'
    end
  end
  
  def show
	@rating = Rating.find(params[:id])
	@title = "Show Rating"
  end

end
