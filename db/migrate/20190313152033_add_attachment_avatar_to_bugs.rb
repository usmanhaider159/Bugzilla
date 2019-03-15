class AddAttachmentAvatarToBugs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :bugs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :bugs, :avatar
  end
end
