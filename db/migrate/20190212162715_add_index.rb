class AddIndex < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      add_index :users, :email,                unique: true
      add_index :users, :reset_password_token, unique: true
    end
  end
end
