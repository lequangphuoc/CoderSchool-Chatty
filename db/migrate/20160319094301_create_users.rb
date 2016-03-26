class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :current_sign_in_at

      t.timestamps null: false
    end
  end
end
