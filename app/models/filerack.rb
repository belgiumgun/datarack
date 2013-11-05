class Filerack < ActiveRecord::Base
    
  belongs_to :resume
    
    has_attached_file :datafile
    
    
    
end
