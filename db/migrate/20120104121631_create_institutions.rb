class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.string :address
      t.integer :post_office_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
