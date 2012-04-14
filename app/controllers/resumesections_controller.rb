class ResumesectionsController < ApplicationController
 
	  
  def show
	@resumesection = Resumesection.find(params[:id])
	@title = "Show Resume Sections"
  end
  
  def new
	@title = "New Resume"
	@resumesection = Resumesection.new
    #@myContact = Section.find_all_by_userid(current_user.id)
	#@myContact = Section.find_all_by_userid(current_user.id, :conditions => "typesection = 'Header'")
	
	if (Section.find_all_by_userid_and_typesection(current_user.id, 'Contact') != nil)
		@myContact = Section.find_all_by_userid_and_typesection(current_user.id, 'Contact')
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Objective') != nil)
		@myObjective = Section.find_all_by_userid_and_typesection(current_user.id, 'Objective')
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Qualifications') != nil)
		@myQualifications = Section.find_all_by_userid_and_typesection(current_user.id, 'Qualifications')
	
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Education') != nil)
		@myEducation = Section.find_all_by_userid_and_typesection(current_user.id, 'Education')
	
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Skills') != nil)
		@mySkills =	Section.find_all_by_userid_and_typesection(current_user.id, 'Skills')
	
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Employment History') != nil)
		@myEmplHistory = Section.find_all_by_userid_and_typesection(current_user.id, 'Employment History')
	
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'List of References') != nil)
		@myListRef = Section.find_all_by_userid_and_typesection(current_user.id, 'List of References')
	
	end
	
	if(Section.find_all_by_userid_and_typesection(current_user.id, 'Other') != nil)
		@myOther =	Section.find_all_by_userid_and_typesection(current_user.id, 'Other')
	
	end


	
  end
  
  
  def list
	@title = "Resume List"
	@resumesection = Resumesection.find(:all, :include => :section)
	#@section = Section.find_all_by_resumeid(params[:id], :include => :resumesection)
	
	#code from DEMO APP
	respond_to do |format|
      format.html 
      format.xml  { render :xml => @resumesection }
    end

  end
  
  def create	
    @resumesection = Resumesection.new(params[:resumesection])
	
    if @resumesection.save
      flash[:success] = "Resume Section created!"
      redirect_to "/newresumelist/#{params[:id]}"
    else
      @title = "New Resume"
      render 'new'
	end
  end
  
end


