class AddSkillsToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :skills, :string
  end
end
