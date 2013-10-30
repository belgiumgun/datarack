class WelcomeController < ApplicationController
  def index
   # @filerack = Filerack.new
   # @allfiles=Filerack.all
    @allresumes=Resume.all
   # @resume = Resume.new
    
   
    
    if (current_user)
      render 'welcome/home'
    else
      render 'welcome/index'
    end
  end
  


  def displaylist

    @allresumes=Resume.all


    respond_to do |format|    
   # format.html
      format.js{ render "displaylist.js" }
    
    end
    
    
  end
  def candidate_form
      @filerack = Filerack.new
   # @allfiles=Filerack.all
   # @allresumes=Resume.all
    @resume = Resume.new
    
    @search_results=Resume.search do 
      fulltext params[:search]
     end
    @search_results= @search_results.results
    
    render 'welcome/candidate_page'
   end
  
  
  def insertfile
    params["filerack"]["datafile"].each do |datafile|
    params["filerack"]["datafile"]= datafile
    file_params= params.require(:filerack).permit(:datafile)
      @filerack = Filerack.create(file_params) do |u|
        u.user_id = current_user.id
        u.score = 0
      end
    end
    resume_params= params.require(:resume).permit(:candidate_name,:location,:email,:phone,:overall_experience,:relevant_experience,:current_ctc,:expected_ctc,:notice_period,:relocation,:availablity,:remarks,:submitted_by,:source,:skills)
    @resume = Resume.create(resume_params) do |r|
      r.file_id = @filerack.id
    end
    @allfiles = Filerack.all
    @allresumes=Resume.all
   p @allfiles.count
   redirect_to :back  
 end
 
  
  def deletefile
    @filerack= Filerack.new
    @resume = Resume.new
    Filerack.where(:id=>params["id"].to_i).first.delete
    render nothing: true      
  end
    
  def candidate_search
    @resumes=Resume.search do 
      fulltext params["candidate_search"]
    end
    @search_results=@resumes.results
    
    respond_to do |format|
      format.js {render "search.js"}
    end
  end
  
end
