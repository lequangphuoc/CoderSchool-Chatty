class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :channel, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :is_read
      t.datetime :read_at

      t.timestamps null: false
    end
  end
end
