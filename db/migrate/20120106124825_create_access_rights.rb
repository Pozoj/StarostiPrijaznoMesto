class CreateAccessRights < ActiveRecord::Migration
  def change
    create_table :access_rights do |t|    
      t.string :user_kind_id 
      t.string  :name
      t.string  :right
      t.timestamps
    end
  end
end
