class AddAttachmentDatafileToFileracks < ActiveRecord::Migration
  def self.up
    change_table :fileracks do |t|
      t.attachment :datafile
    end
  end

  def self.down
    drop_attached_file :fileracks, :datafile
  end
end
