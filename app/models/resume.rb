class Resume < ActiveRecord::Base
  
  has_one :filerack
  
  #paginates_per 2
  
  
  searchable  do
    text :skills
    text :location 
    text :overall_experience 
    text :relevant_experience 
    text :current_ctc 
    text :expected_ctc 
    text :notice_period 
    text :relocation 
    text :availablity 
    text :email 
    text :phone 
    text :candidate_name 
  end
  
  
  
end
