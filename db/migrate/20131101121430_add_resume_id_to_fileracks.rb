class AddResumeIdToFileracks < ActiveRecord::Migration
  def change
    add_column :fileracks, :resume_id, :integer
  end
end
