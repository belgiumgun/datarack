class AddFileIdAndField1ToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :file_id, :string
    add_column :resumes, :field1, :string
  end
end
