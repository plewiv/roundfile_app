class ResumesController < ApplicationController
  
  def show
	@resume = Resume.find(params[:id])
	@title = "Show Resume"
  end
  
  def new
  end
  
  
  
  
  def allresumes
	@title = "All Resumes"
	@resume = Resume.all
	
	#code from DEMO APP
	respond_to do |format|
      format.html
      format.xml  { render :xml => @resume }
    end
  end
	
  def myresumes
	@title = "My Resumes"
	@resume = Resume.find_all_by_userid(current_user.id)
	
	
	#code from DEMO APP
	respond_to do |format|
      format.html 
      format.xml  { render :xml => @resume }
    end
  end

  
end
