class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :candidate_name
      t.string :location
      t.string :email
      t.string :phone
      t.string :overall_experience
      t.string :relevant_experience
      t.string :current_ctc
      t.string :expected_ctc
      t.string :notice_period
      t.string :relocation
      t.string :availablity
      t.string :remarks
      t.string :submitted_by
      t.string :source
      
      t.timestamps
    end
  end
end
