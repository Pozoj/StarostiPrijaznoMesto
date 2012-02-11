class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :user_kind_id
      t.integer :institution_id
      t.boolean :admin, :default => false
      
      t.recoverable
      t.database_authenticatable :null => false
      t.encryptable
      t.rememberable
      t.trackable
      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

end
