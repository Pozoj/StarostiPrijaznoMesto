class CreatePostOffices < ActiveRecord::Migration
  def change
    create_table :post_offices do |t|
      t.integer :post_number
      t.string :city
    end
  end
end
