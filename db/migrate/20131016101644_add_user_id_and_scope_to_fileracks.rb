class AddUserIdAndScopeToFileracks < ActiveRecord::Migration
  def change
    add_column :fileracks, :user_id, :integer
    add_column :fileracks, :score, :integer
  end
end
