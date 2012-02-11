class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :institution_id
      t.integer :user_id
      t.integer :post_office_id
      t.string :title
      t.datetime :date_and_time_at
      t.text :description
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
