class WelcomeController < ApplicationController
  def index
    
    
   # @filerack = Filerack.new
   @allfiles=Filerack.all
    @allresumes=Resume.all.page(params[:page]).per(2)
    # @resume = Resume.new
    if (current_user)
      render 'welcome/home',notice: "Hellow! welcome!!"
    else
      render 'welcome/index',notice: "Hellow! welcome!!"
    end
  end
  


  def candidate_form
     @filerack = Filerack.new
    @resume = Resume.new
   # @search_results=Resume.search do 
   #   fulltext params[:search]
   #  end
   # @search_results= @search_results.results
    render 'welcome/candidate_page',notice: "welcome to candidate form"
   end
  
  
  def insertfile
    #code for multiple files upload.. commenting it because requirement has changed to single file upload
    #params["filerack"]["datafile"].each do |datafile|
    #params["filerack"]["datafile"]= datafile
    
    resume_params= params.require(:resume).permit(:candidate_name,:location,:email,:phone,:overall_experience,:relevant_experience,:current_ctc,:expected_ctc,:notice_period,:relocation,:availablity,:remarks,:submitted_by,:source,:skills,:visa_status,:visa_emp,:martial_status,:current_status)
    file_params= params.require(:filerack).permit(:datafile)
          @resume = Resume.create(resume_params) do |r|
              r.submitted_by= current_user.email
           end
      @filerack = @resume.create_filerack(file_params) do |u|
        u.user_id = current_user.id
        u.score = 0
         redirect_to :back,record_created: @resume.candidate_name+" details has been saved!"  
    end
    
  #  end
 
   # @resume = Resume.create(resume_params) do |r|
   #   r.file_id = @filerack.id
   # end
    
    
    #@allfiles = Filerack.all
    #@allresumes=Resume.all
    
  
 end
 
  def delete_record
    p params
    @resume=Resume.where(:id=>params["id"].to_i).first
    #@file = Filerack.where(:id=>@resume.file_id).first
    #@resume.delete
    #@file.delete
    @resume.filerack.delete
    @resume.delete
    
    render nothing: true
  
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
 
  
  def download_file
    p params[:file_id]
    @file_id = params[:file_id]
    @f = Filerack.where(:id=>@file_id).first
    #send_file @f.datafile.path
    
    @file_path= @f.datafile.path
    p @file_path
    p @f
    
    @var= "<a href='#{@file_path}' download id=""file_download>"
    p @var
    respond_to do |format|
     # format.js '$(document).append("<a href='@file_path' download id="download"></a>");$.("")'
     #format.json {render json: @file_path}
     # format.js {render js: "$(document).append('{@var}');alert('hellow world');"}
      format.js {render 'file_download'}
      #format.js {render js: "alert('Hello Rails');"}
    end
  end
  
  def show_details
    p params[:record_id]
    @show_resume=Resume.where(:id=>params[:record_id]).first
    p @show_resume
    respond_to do |format|
      format.js {render "show_details.js"}
    end
  end
  
  def edit_candidate_details
    p params[:record_id]
    @record_id = params[:record_id]
    @resume=Resume.where(:id=>params[:record_id]).first
    @filerack=@resume.filerack
    respond_to do |format|
      format.js {render "edit_details.js"}
    end
   end
  
  def update_candidate_details
     p params
    #update_notices
    @resume=Resume.where(:id=>params["resume"]["id"]).first
      
    
    if(params[:resume])
       filtered_resume_params = params[:resume].permit("candidate_name","email","phone","skills","martial_status","current_status","visa_status","visa_emp","location","relocation","overall_experience","relevant_experience","current_ctc","expected_ctc","notice_period","availablity","remarks","source")
      if(@resume.update_attributes(filtered_resume_params))
        @notice = "Candidate details has been updated"
      end
   
     end
    if(params[:filerack])
       filtered_file_params= params.require(:filerack).permit(:datafile)
        if(@resume.filerack.update_attributes(filtered_file_params))
          @notice=@notice + "/n Previous resume hasbeen deleted and new one updated!"
        else
          @notice=@notice + "/n File uploading has been failed.. Please try refresh the page.!"
          end
   end
    
   
    p @notice
    redirect_to :back , update_notices: @notice
  end
  
  
end
