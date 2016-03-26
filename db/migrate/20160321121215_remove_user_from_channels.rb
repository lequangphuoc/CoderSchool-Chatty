class RemoveUserFromChannels < ActiveRecord::Migration
  def change
    remove_column :channels, :sender_id, :integer
    remove_column :channels, :recipient_id, :integer
  end
end
