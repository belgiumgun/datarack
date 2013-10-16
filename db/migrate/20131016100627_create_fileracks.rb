class CreateFileracks < ActiveRecord::Migration
  def change
    create_table :fileracks do |t|

      t.timestamps
    end
  end
end
