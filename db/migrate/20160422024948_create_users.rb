class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :alias, limit: 20, null: false
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :users, :alias, unique: true
  end
end
