class WelcomeController < ApplicationController
  def index
      @filerack = Filerack.new
      
    
  end
  
  
  def insertfile
  
  p params[:datafile]
  p params[:filerack]

  file_params= params.require(:filerack).permit(:datafile)
  p file_params
p file_params
  @filerack = Filerack.create(file_params)
    @allfiles = Filerack.all
    
    render "welcome/display"
    
    
    
 end
  
end
