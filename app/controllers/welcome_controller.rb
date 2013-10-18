class WelcomeController < ApplicationController
  def index
      @filerack = Filerack.new
    if current_user.nil? 
      render "welcome/index"
    else
    @allfiles = Filerack.where(:user_id =>current_user.id)
      render "welcome/home"
    end
  end
  
  
  def insertfile
  
  p params[:datafile]
  p params[:filerack]

  file_params= params.require(:filerack).permit(:datafile)
    @filerack = Filerack.create(file_params) do |u|
      u.user_id = current_user.id
      u.score = 0
    end
    p current_user.id.class
    @allfiles = Filerack.where(:user_id =>current_user.id)
    p @allfiles.count
    render "welcome/home"
      
 end
    
    def deletefile
    p params
      @filerack= Filerack.new
      
     render nothing: true      
      
    end
    
    
  
  def home
  end
  
  
end
