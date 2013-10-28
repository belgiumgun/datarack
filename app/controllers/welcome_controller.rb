class WelcomeController < ApplicationController
  def index
    @filerack = Filerack.new
    @allfiles=Filerack.all
    if (current_user)
      render 'welcome/home'
    else
      render 'welcome/index'
    end
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
      
   @allfiles = Filerack.where(:user_id =>current_user.id)
   p @allfiles.count
   redirect_to :back  
 end
 
  
  def deletefile
    @filerack= Filerack.new
    Filerack.where(:id=>params["id"].to_i).first.delete
    
    
    render nothing: true      
  end
    
    
    
  
end
