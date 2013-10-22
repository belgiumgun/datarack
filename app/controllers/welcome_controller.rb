class WelcomeController < ApplicationController
  def index
      @filerack = Filerack.new
      
    
  end
  
  
  def insertfile
  
  p params[:datafile]
  p params[:filerack]

  file_params= params.require(:filerack).permit(:datafile)

    p file_params
    
    @filerack = Filerack.create(file_params) do |u|
      u.user_id = current_user.id
      u.score = 0
    end
    
    p current_user.id.class
    @allfiles = Filerack.where(:user_id =>current_user.id)
    p @allfiles.count
   # render "welcome/home"
      redirect_to :back  
 end
    
    def deletefile



      @filerack= Filerack.new

      Filerack.where(:id=>params["id"].to_i).first.delete
     render nothing: true      
      
    end
    
    def downloadfile file_path
    send_file(file_path, :disposition => "attachment")
    end
    
  
end
