class CreateChannelMembers < ActiveRecord::Migration
  def change
    create_table :channel_members do |t|
      t.references :channel, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
